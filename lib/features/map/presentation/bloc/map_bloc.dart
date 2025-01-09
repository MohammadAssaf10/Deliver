import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/location_info.dart';
import '../../domain/repositories/map_repository.dart';
import 'map_event.dart';
import 'map_state.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final Location _location;
  final MapRepository _mapRepository;
  final Completer<GoogleMapController> mapCompleter =
      Completer<GoogleMapController>();
  final PanelController panelController = PanelController();

  void getCurrentLocation() => add(GetCurrentLocation());

  void changeIsPanelOpenState(bool isPanelOpen) =>
      add(ChangeIsPanelOpenState((b) => b..isPanelOpen = isPanelOpen));

  void changeIsStartPointState(bool? isStartPoint) =>
      add(ChangeIsStartPointState((b) => b..isStartPoint = isStartPoint));

  void setStartPoint(LocationInfo startPoint) =>
      add(SetStartPoint((b) => b..startPoint = startPoint));

  void setEndPoint(LocationInfo endPoint) =>
      add(SetEndPoint((b) => b..endPoint = endPoint));

  void calculateDistance() => add(CalculateDistance());

  void setHintMessage(String message) =>
      add(SetHintMessage((b) => b..message = message));

  void createNewTrip() => add(CreateNewTrip());

  MapBloc(
    this._location,
    this._mapRepository,
  ) : super(MapState.initial()) {
    on<GetCurrentLocation>(
      (event, emit) async {
        LocationInfo? startLocation;
        final bool isLocationServiceEnabled =
            await _ensureLocationServiceEnabled();
        if (!isLocationServiceEnabled) return;

        final LocationData locationData = await _location.getLocation();
        if (locationData.latitude == null && locationData.longitude == null) {
          return;
        }
        final GoogleMapController googleMapController =
            await mapCompleter.future;

        startLocation = await _getLocationInfoPlacemark(LocationInfo(
          markerState: MarkerState.start,
          latitude: locationData.latitude,
          longitude: locationData.longitude,
        ));
        final Set<Marker> updatedMarkers = _updateMarkerSet(
          markers: state.markers.toSet(),
          markerState: MarkerState.start,
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
          googleMapController: googleMapController,
        );

        emit(
          state.rebuild(
            (b) => b
              ..startLocation = startLocation
              ..googleMapController = googleMapController
              ..markers.replace(updatedMarkers),
          ),
        );
      },
      transformer: droppable(),
    );

    on<ChangeIsPanelOpenState>((event, emit) {
      emit(state.rebuild((b) => b..isPanelOpen = event.isPanelOpen));
    });

    on<ChangeIsStartPointState>((event, emit) async {
      await panelController.close();
      emit(state.rebuild(
        (b) => b
          ..isStartPoint = event.isStartPoint
          ..isPanelOpen = false,
      ));
    });

    on<SetHintMessage>((event, emit) {
      emit(state.rebuild((b) => b..message = event.message));
    });

    on<SetStartPoint>((event, emit) async {
      final LocationInfo updatedLocationInfo =
          await _getLocationInfoPlacemark(event.startPoint);
      final Set<Marker> updatedMarkers = _updateMarkerSet(
        markers: state.markers.toSet(),
        markerState: updatedLocationInfo.markerState!,
        latitude: updatedLocationInfo.latitude!,
        longitude: updatedLocationInfo.longitude!,
        googleMapController: state.googleMapController!,
      );
      await panelController.open();
      emit(state.rebuild(
        (b) => b
          ..startLocation = updatedLocationInfo
          ..markers.replace(updatedMarkers)
          ..isPanelOpen = true
          ..isStartPoint = null
          ..message = "",
      ));
      calculateDistance();
    });

    on<SetEndPoint>((event, emit) async {
      final LocationInfo updatedLocationInfo =
          await _getLocationInfoPlacemark(event.endPoint);
      final Set<Marker> updatedMarkers = _updateMarkerSet(
        markers: state.markers.toSet(),
        markerState: updatedLocationInfo.markerState!,
        latitude: updatedLocationInfo.latitude!,
        longitude: updatedLocationInfo.longitude!,
        googleMapController: state.googleMapController!,
      );
      await panelController.open();
      emit(state.rebuild(
        (b) => b
          ..endLocation = updatedLocationInfo
          ..markers.replace(updatedMarkers)
          ..isPanelOpen = true
          ..isStartPoint = null
          ..message = "",
      ));
      calculateDistance();
    });

    on<CalculateDistance>(
      (event, emit) async {
        if (state.startLocation == null || state.endLocation == null) {
          return;
        }
        final result = await _mapRepository.calculateDistance(
          startLocation: state.startLocation!,
          endLocation: state.endLocation!,
        );
        result.fold((failure) {
          dPrint(
            "Error From CalculateDistance event ${failure.errorMessage}",
            stringColor: StringColor.red,
          );
        }, (data) {
          emit(state.rebuild((b) => b..tripInfo = data));
        });
      },
      transformer: restartable(),
    );

    on<CreateNewTrip>(
      (event, emit) async {
        if (state.startLocation == null ||
            state.endLocation == null ||
            state.tripInfo == null) {
          return;
        }
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await _mapRepository.createNewTrip(
          startLocation: state.startLocation!,
          endLocation: state.endLocation!,
          tripInfo: state.tripInfo!,
        );
        result.fold((failure) {
          emit(state.rebuild((b) => b..isLoading = false));
          dPrint(
            "Error from CreateNewTrip bloc event: ${failure.errorMessage}",
            stringColor: StringColor.red,
          );
        }, (_) {
          emit(state.rebuild((b) => b..isLoading = false));
        });
      },
      transformer: droppable(),
    );
  }

  Future<bool> _ensureLocationServiceEnabled() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        showCustomToast(
          toastMessage: S.current.pleaseTurnOnLocationServiceAndTryAgain,
          isError: true,
        );
        return false;
      }
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted != PermissionStatus.granted) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        showCustomToast(
          toastMessage:
              S.current.pleaseAllowAppToAccessYourCurrentLocationAndTryAgain,
          isError: true,
        );
        return false;
      }
    }
    return true;
  }

  Set<Marker> _updateMarkerSet({
    required Set<Marker> markers,
    required MarkerState markerState,
    required double latitude,
    required double longitude,
    required GoogleMapController googleMapController,
  }) {
    final Set<Marker> updatedMarkers = Set<Marker>.from(markers);
    updatedMarkers.removeWhere(
      (marker) => marker.markerId.value == markerState.index.toString(),
    );

    updatedMarkers.add(Marker(
      markerId: MarkerId(markerState.index.toString()),
      position: LatLng(latitude, longitude),
    ));

    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            latitude,
            longitude,
          ),
          zoom: 16,
        ),
      ),
    );

    return updatedMarkers;
  }

  Future<LocationInfo> _getLocationInfoPlacemark(LocationInfo location) async {
    LocationInfo updatedLocationInfo = location;
    try {
      final geocoding.Placemark placemark =
          (await geocoding.placemarkFromCoordinates(
                  location.latitude!, location.longitude!))
              .first;
      updatedLocationInfo = location.copyWith(
        administrativeArea: placemark.administrativeArea,
        locality: placemark.locality,
        street: placemark.street,
      );
    } catch (e) {
      dPrint("Error from get location placemark: $e",
          stringColor: StringColor.red);
    }
    return updatedLocationInfo;
  }
}

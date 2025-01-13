import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/models/address.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/map_repository.dart';
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

  void setIsStartAddress(bool? isStartAddress) =>
      add(SetIsStartAddress((b) => b..isStartAddress = isStartAddress));

  void setStartAddress(Address address) =>
      add(SetStartAddress((b) => b..address = address));

  void setEndAddress(Address address) =>
      add(SetEndAddress((b) => b..address = address));

  void calculateDistance() => add(CalculateDistance());

  void setHintMessage(String message) =>
      add(SetHintMessage((b) => b..message = message));

  void createNewTrip() => add(CreateNewTrip());

  void setCurrentTrip(Trip trip) => add(SetCurrentTrip((b) => b..trip = trip));

  MapBloc(
    this._location,
    this._mapRepository,
  ) : super(MapState.initial()) {
    on<GetCurrentLocation>(
      (event, emit) async {
        final bool isLocationServiceEnabled =
            await _ensureLocationServiceEnabled();
        if (!isLocationServiceEnabled) return;

        final LocationData locationData = await _location.getLocation();
        if (locationData.latitude == null || locationData.longitude == null) {
          return;
        }
        final GoogleMapController googleMapController =
            await mapCompleter.future;

        final Address currentAddress = await _getAddressPlacemark(Address(
          markerState: MarkerState.currentLocation,
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        ));
        final Set<Marker> updatedMarkers = _updateMarkerSet(
          markers: state.markers.toSet(),
          markerState: MarkerState.currentLocation,
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
          googleMapController: googleMapController,
        );

        emit(
          state.rebuild(
            (b) => b
              ..currentAddress = currentAddress
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

    on<SetIsStartAddress>((event, emit) async {
      await panelController.close();
      emit(state.rebuild(
        (b) => b
          ..isStartAddress = event.isStartAddress
          ..isPanelOpen = false,
      ));
    });

    on<SetHintMessage>((event, emit) {
      emit(state.rebuild((b) => b..message = event.message));
    });

    on<SetStartAddress>((event, emit) async {
      final Address updatedAddress = await _getAddressPlacemark(event.address);
      final Set<Marker> updatedMarkers = _updateMarkerSet(
        markers: state.markers.toSet(),
        markerState: updatedAddress.markerState!,
        latitude: updatedAddress.latitude,
        longitude: updatedAddress.longitude,
        googleMapController: state.googleMapController!,
      );
      await panelController.open();
      emit(state.rebuild(
        (b) => b
          ..tripStartAddress = updatedAddress
          ..markers.replace(updatedMarkers)
          ..isPanelOpen = true
          ..isStartAddress = null
          ..message = "",
      ));
      calculateDistance();
    });

    on<SetEndAddress>((event, emit) async {
      final Address updatedAddress = await _getAddressPlacemark(event.address);
      final Set<Marker> updatedMarkers = _updateMarkerSet(
        markers: state.markers.toSet(),
        markerState: updatedAddress.markerState!,
        latitude: updatedAddress.latitude,
        longitude: updatedAddress.longitude,
        googleMapController: state.googleMapController!,
      );
      await panelController.open();
      emit(state.rebuild(
        (b) => b
          ..tripEndAddress = updatedAddress
          ..markers.replace(updatedMarkers)
          ..isPanelOpen = true
          ..isStartAddress = null
          ..message = "",
      ));
      calculateDistance();
    });

    on<CalculateDistance>(
      (event, emit) async {
        if ((state.tripStartAddress == null && state.currentAddress == null) ||
            state.tripEndAddress == null) {
          return;
        }
        emit(state.rebuild(
          (b) => b
            ..isLoading = true
            ..tripDistanceAndDuration = null,
        ));

        final result = await _mapRepository.calculateDistance(
          startLocation: state.tripStartAddress?.toLocationRequest() ??
              state.currentAddress!.toLocationRequest(),
          endLocation: state.tripEndAddress!.toLocationRequest(),
        );
        result.fold((failure) {
          emit(state.rebuild((b) => b..isLoading = false));
          dPrint(
            "Error From CalculateDistance event ${failure.errorMessage}",
            stringColor: StringColor.red,
          );
        }, (data) {
          emit(state.rebuild(
            (b) => b
              ..tripDistanceAndDuration = data
              ..isLoading = false,
          ));
        });
      },
      transformer: restartable(),
    );

    on<CreateNewTrip>(
      (event, emit) async {
        if ((state.tripStartAddress == null && state.currentAddress == null) ||
            state.tripEndAddress == null ||
            state.tripDistanceAndDuration == null) {
          return;
        }
        emit(state.rebuild((b) => b..isLoading = true));
        final result = await _mapRepository.createNewTrip(
          startLocation: state.tripStartAddress?.toLocationRequest() ??
              state.currentAddress!.toLocationRequest(),
          endLocation: state.tripEndAddress!.toLocationRequest(),
          tripInfo: state.tripDistanceAndDuration!,
        );
        result.fold((failure) {
          showToastMessage(failure.errorMessage, isError: true);
          emit(state.rebuild((b) => b..isLoading = false));
          dPrint(
            "Error from CreateNewTrip bloc event: ${failure.errorMessage}",
            stringColor: StringColor.red,
          );
        }, (data) {
          panelController.close();
          final String formattedDate =
              DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

          final Trip currentTrip = Trip(
            id: data,
            calculatedDuration: state.tripDistanceAndDuration!.duration,
            calculatedDistance: state.tripDistanceAndDuration!.distance,
            pickUpAddress: state.tripStartAddress ?? state.currentAddress!,
            dropOfAddress: state.tripEndAddress!,
            tripStatus: TripStatus.waiting,
            createdDate: formattedDate,
          );
          showToastMessage(S.current.tripCreatedSuccessfully);
          emit(state.rebuild(
            (b) => b
              ..isLoading = false
              ..tripStartAddress = null
              ..tripEndAddress = null
              ..currentAddress = null
              ..tripDistanceAndDuration = null
              ..message = ""
              ..isPanelOpen = false
              ..isStartAddress = null
              ..currentTrip = currentTrip,
          ));
        });
      },
      transformer: droppable(),
    );

    on<SetCurrentTrip>((event, emit) async {
      Set<Marker> markers = {};
      emit(state.rebuild((b) => b..currentTrip = event.trip));
      final Address tripStartAddress =
          await _getAddressPlacemark(event.trip.pickUpAddress);
      markers = _updateMarkerSet(
        markers: state.markers.toSet(),
        markerState: MarkerState.tripStartLocation,
        latitude: tripStartAddress.latitude,
        longitude: tripStartAddress.longitude,
      );
      final Address tripEndAddress =
          await _getAddressPlacemark(event.trip.dropOfAddress);
      markers = _updateMarkerSet(
        markers: markers,
        markerState: MarkerState.tripEndLocation,
        latitude: tripEndAddress.latitude,
        longitude: tripEndAddress.longitude,
      );
      emit(state.rebuild(
        (b) => b
          ..tripStartAddress = tripStartAddress
          ..tripEndAddress = tripEndAddress
          ..markers.replace(markers),
      ));
    });
  }

  Future<bool> _ensureLocationServiceEnabled() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        showToastMessage(S.current.pleaseTurnOnLocationServiceAndTryAgain);
        return false;
      }
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted != PermissionStatus.granted) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        showToastMessage(
            S.current.pleaseAllowAppToAccessYourCurrentLocationAndTryAgain);
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
    GoogleMapController? googleMapController,
  }) {
    final Set<Marker> updatedMarkers = Set<Marker>.from(markers);
    updatedMarkers.removeWhere(
      (marker) => marker.markerId.value == markerState.index.toString(),
    );

    updatedMarkers.add(
      Marker(
        markerId: MarkerId(markerState.index.toString()),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: markerState.name),
      ),
    );
    if (googleMapController != null) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              latitude,
              longitude,
            ),
            zoom: 15,
          ),
        ),
      );
    }

    return updatedMarkers;
  }

  Future<Address> _getAddressPlacemark(Address address) async {
    Address updatedAddress = address;
    try {
      final geocoding.Placemark placemark = (await geocoding
              .placemarkFromCoordinates(address.latitude, address.longitude))
          .first;
      updatedAddress = address.copyWith(
        administrativeArea: placemark.administrativeArea,
        locality: placemark.locality,
        street: placemark.street,
      );
    } catch (e) {
      dPrint("Error from get location placemark: $e",
          stringColor: StringColor.red);
    }
    return updatedAddress;
  }
}

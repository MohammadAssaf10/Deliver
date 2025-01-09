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

  void getCurrentLocation() {
    add(GetCurrentLocation());
  }

  void changeIsPanelOpenState(bool isPanelOpen) {
    add(ChangeIsPanelOpenState(
      (b) => b..isPanelOpen = isPanelOpen,
    ));
  }

  void changeIsStartPointState(bool? isStartPoint) {
    add(ChangeIsStartPointState((b) => b..isStartPoint = isStartPoint));
  }

  void setStartPoint(LocationInfo startPoint) {
    add(SetStartPoint((b) => b..startPoint = startPoint));
  }

  void setEndPoint(LocationInfo endPoint) {
    add(SetEndPoint((b) => b..endPoint = endPoint));
  }

  void calculateDistance() {
    add(CalculateDistance());
  }

  void setHintMessage(String message) {
    add(SetHintMessage((b) => b..message = message));
  }

  void createNewTrip() {
    add(CreateNewTrip());
  }

  MapBloc(
    this._location,
    this._mapRepository,
  ) : super(MapState.initial()) {
    on<GetCurrentLocation>(
      (event, emit) async {
        bool serviceEnabled = await _location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await _location.requestService();
          if (!serviceEnabled) {
            showCustomToast(
              toastMessage: S.current.pleaseTurnOnLocationServiceAndTryAgain,
              isError: true,
            );
            return;
          }
        }

        PermissionStatus permissionGranted = await _location.hasPermission();
        if (permissionGranted != PermissionStatus.granted) {
          permissionGranted = await _location.requestPermission();
          if (permissionGranted != PermissionStatus.granted) {
            showCustomToast(
              toastMessage: S
                  .current.pleaseAllowAppToAccessYourCurrentLocationAndTryAgain,
              isError: true,
            );
            return;
          }
        }

        final LocationData locationData = await _location.getLocation();
        if (locationData.latitude != null && locationData.longitude != null) {
          final GoogleMapController googleMapController =
              await mapCompleter.future;
          await googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(locationData.latitude!, locationData.longitude!),
                zoom: 16,
              ),
            ),
          );
          final LocationInfo startLocation = LocationInfo(
            markerState: MarkerState.start,
            latitude: locationData.latitude,
            longitude: locationData.longitude,
          );
          // Remove the existing marker with the same ID if it exists
          final Set<Marker> updatedMarkers = Set<Marker>.from(state.markers);
          updatedMarkers.removeWhere((marker) =>
              marker.markerId.value == MarkerState.start.index.toString());

          // Create a new marker
          final Marker marker = Marker(
            markerId: MarkerId(startLocation.markerState!.index.toString()),
            position: LatLng(
              startLocation.latitude!,
              startLocation.longitude!,
            ),
          );

          // Add the new marker to the updated set
          updatedMarkers.add(marker);
          emit(
            state.rebuild(
              (b) => b
                ..startLocation = startLocation
                ..googleMapController = googleMapController
                ..markers.replace(updatedMarkers),
            ),
          );
          final geocoding.Placemark placeMark =
              (await geocoding.placemarkFromCoordinates(
            startLocation.latitude!,
            startLocation.longitude!,
          ))
                  .first;
          final LocationInfo fullStartLocationInfo =
              state.startLocation!.copyWith(
            administrativeArea: placeMark.administrativeArea,
            locality: placeMark.locality,
            street: placeMark.street,
          );
          emit(state.rebuild((b) => b..startLocation = fullStartLocationInfo));
        }
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
      LocationInfo? fullStartLocationInfo;
      try {
        final geocoding.Placemark placeMark =
            (await geocoding.placemarkFromCoordinates(
          event.startPoint.latitude!,
          event.startPoint.longitude!,
        ))
                .first;
        fullStartLocationInfo = event.startPoint.copyWith(
          markerState: MarkerState.start,
          administrativeArea: placeMark.administrativeArea,
          locality: placeMark.locality,
          street: placeMark.street,
        );
      } catch (e) {
        dPrint("Can't get full start location info $e",
            stringColor: StringColor.red);
      }
      // Remove the existing marker with the same ID if it exists
      final Set<Marker> updatedMarkers = Set<Marker>.from(state.markers);
      updatedMarkers.removeWhere((marker) =>
          marker.markerId.value == MarkerState.start.index.toString());

      // Create a new marker
      final Marker marker = Marker(
        markerId: MarkerId(MarkerState.start.index.toString()),
        position: LatLng(
          event.startPoint.latitude!,
          event.startPoint.longitude!,
        ),
      );

      // Add the new marker to the updated set
      updatedMarkers.add(marker);

      await state.googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(event.startPoint.latitude!, event.startPoint.longitude!),
            zoom: 16,
          ),
        ),
      );
      await panelController.open();
      emit(state.rebuild(
        (b) => b
          ..startLocation = fullStartLocationInfo ?? event.startPoint
          ..markers.replace(updatedMarkers)
          ..isPanelOpen = true
          ..isStartPoint = null
          ..message = "",
      ));
      calculateDistance();
    });

    on<SetEndPoint>((event, emit) async {
      LocationInfo? fullEndLocationInfo;
      try {
        final geocoding.Placemark placeMark =
            (await geocoding.placemarkFromCoordinates(
          event.endPoint.latitude!,
          event.endPoint.longitude!,
        ))
                .first;
        fullEndLocationInfo = event.endPoint.copyWith(
          markerState: MarkerState.end,
          administrativeArea: placeMark.administrativeArea,
          locality: placeMark.locality,
          street: placeMark.street,
        );
      } catch (e) {
        dPrint("Can't get full end location info $e",
            stringColor: StringColor.red);
      }
      // Remove the existing marker with the same ID if it exists
      final Set<Marker> updatedMarkers = Set<Marker>.from(state.markers);
      updatedMarkers.removeWhere((marker) =>
          marker.markerId.value == MarkerState.end.index.toString());

      // Create a new marker
      final Marker marker = Marker(
        markerId: MarkerId(MarkerState.end.index.toString()),
        position: LatLng(
          event.endPoint.latitude!,
          event.endPoint.longitude!,
        ),
      );

      // Add the new marker to the updated set
      updatedMarkers.add(marker);

      await state.googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              event.endPoint.latitude!,
              event.endPoint.longitude!,
            ),
            zoom: 16,
          ),
        ),
      );
      await panelController.open();
      emit(state.rebuild(
        (b) => b
          ..endLocation = fullEndLocationInfo ?? event.endPoint
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
          emit(state.rebuild((b) => b..isLoading = false));
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
        if (state.startLocation == null || state.endLocation == null) {
          return;
        } else if (state.tripInfo == null) {
          dPrint(
            "Calculate Distance",
            stringColor: StringColor.green,
          );
          emit(state.rebuild((b) => b..isLoading = true));
          // Create a Completer to wait for CalculateDistance to finish
          final completer = Completer<void>();

          // Listen to state changes to know when tripInfo is updated
          final subscription = stream.listen((updatedState) {
            if ((updatedState.tripInfo != null ||
                    updatedState.isLoading == false) &&
                !completer.isCompleted) {
              completer.complete();
            }
          });

          // Dispatch the CalculateDistance event
          add(CalculateDistance());

          // Wait for the completer to complete
          await completer.future;

          // Cancel the subscription after it's no longer needed
          await subscription.cancel();
        }
        if (state.tripInfo != null) {
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
        } else {
          dPrint(
            S.current.somethingWentWrong,
            stringColor: StringColor.red,
          );
        }
      },
      transformer: droppable(),
    );
  }
}

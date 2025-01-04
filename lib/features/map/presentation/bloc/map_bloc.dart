import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import '../../../../core/utils/app_functions.dart';
import '../../../../generated/l10n.dart';
import '../../domain/repositories/map_repository.dart';
import 'map_event.dart';
import 'map_state.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final Location _location;
  final MapRepository _mapRepository;
  final Completer<GoogleMapController> mapCompleter =
      Completer<GoogleMapController>();

  void addGetCurrentLocation() {
    add(GetCurrentLocation());
  }

  MapBloc(this._location, this._mapRepository) : super(MapState.initial()) {
    on<GetCurrentLocation>((event, emit) async {
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
            toastMessage:
                S.current.pleaseAllowAppToAccessYourCurrentLocationAndTryAgain,
            isError: true,
          );
          return;
        }
      }
      emit(state.rebuild(
        (b) => b..isLoading = true,
      ));

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
        state.markers.toSet().clear();
        final String markerId =
            DateTime.now().microsecondsSinceEpoch.toString();
        emit(
          state.rebuild(
            (b) => b
              ..markers.clear()
              ..markers.add(
                Marker(
                  markerId: MarkerId(markerId),
                  position: LatLng(
                    locationData.latitude!,
                    locationData.longitude!,
                  ),
                ),
              ),
          ),
        );
      }
      emit(state.rebuild(
        (b) => b..isLoading = false,
      ));
    });
  }
}

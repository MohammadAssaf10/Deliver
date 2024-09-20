import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import '../../../../core/utils/app_functions.dart';
import '../../../../generated/l10n.dart';
import 'map_event.dart';
import 'map_state.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final Location location;
  final Completer<GoogleMapController> mapCompleter =
  Completer<GoogleMapController>();

  void addGetCurrentLocation() {
    add(GetCurrentLocation());
  }

  MapBloc(this.location,) : super(MapState.initial()) {
    on<GetCurrentLocation>((event, emit) async {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          showCustomToast(
            toastMessage: S.current.pleaseTurnOnLocationServiceAndTryAgain,
            isError: true,
          );
          return;
        }
      }

      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted != PermissionStatus.granted) {
        permissionGranted = await location.requestPermission();
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

      final LocationData locationData = await location.getLocation();
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
        DateTime
            .now()
            .microsecondsSinceEpoch
            .toString();
        emit(
          state.rebuild(
                (b) =>
            b
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
      debugPrint('Marker Length: ${state.markers.length}');
      emit(state.rebuild(
            (b) => b..isLoading = false,
      ));
    });
  }
}

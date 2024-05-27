import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart' as flutter_map;
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../../../core/utils/functions.dart';
import '../../../../generated/l10n.dart';
import 'map_event.dart';
import 'map_state.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final flutter_map.MapController mapController;
  final Location location;

  void addGetCurrentLocation() {
    add(GetCurrentLocation());
  }

  MapBloc(
    this.mapController,
    this.location,
  ) : super(MapState.initial()) {
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
        mapController.moveAndRotate(
          LatLng(locationData.latitude!, locationData.longitude!),
          16,
          0,
        );
      }
      emit(state.rebuild(
        (b) => b..isLoading = false,
      ));
    });
  }
}

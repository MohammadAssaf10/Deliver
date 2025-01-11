import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/entities/address.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
import '../bloc/map_bloc.dart';

class DeliverMap extends StatelessWidget {
  final Set<Marker> markers;
  final bool? isStartAddress;

  const DeliverMap({
    super.key,
    required this.markers,
    required this.isStartAddress,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: const CameraPosition(
        target: LatLng(33.51385233503283, 36.27651985734701),
        zoom: 15,
      ),
      zoomControlsEnabled: false,
      onTap: (latLan) {
        dPrint("Latitude: ${latLan.latitude} Longitude: ${latLan.longitude}");
        if (isStartAddress != null) {
          final Address address = Address(
            markerState: isStartAddress! ? MarkerState.start : MarkerState.end,
            latitude: latLan.latitude,
            longitude: latLan.longitude,
          );
          if (isStartAddress!) {
            context.read<MapBloc>().setStartAddress(address);
          } else {
            context.read<MapBloc>().setStartAddress(address);
          }
        }
      },
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        context.read<MapBloc>().mapCompleter.complete(controller);
      },
    );
  }
}

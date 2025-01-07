import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/location_info.dart';
import '../bloc/map_bloc.dart';

class DeliverMap extends StatelessWidget {
  final Set<Marker> markers;
  final bool? isStartPoint;

  const DeliverMap({
    super.key,
    required this.markers,
    required this.isStartPoint,
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
        debugPrint(latLan.latitude.toString());
        debugPrint(latLan.longitude.toString());
        if (isStartPoint != null) {
          final LocationInfo locationInfo = LocationInfo(
            latitude: latLan.latitude,
            longitude: latLan.longitude,
          );
          if (isStartPoint!) {
            context.read<MapBloc>().setStartPoint(locationInfo);
          } else {
            context.read<MapBloc>().setEndPoint(locationInfo);
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

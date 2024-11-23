import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/map_bloc.dart';
import '../bloc/map_state.dart';

class DeliverMap extends StatelessWidget {
  const DeliverMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
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
          },
          markers: state.markers.toSet(),
          onMapCreated: (GoogleMapController controller) {
            context.read<MapBloc>().mapCompleter.complete(controller);
          },
        );
      },
    );
  }
}

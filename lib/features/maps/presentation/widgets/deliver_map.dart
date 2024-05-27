import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/di/di.dart';

class DeliverMap extends StatefulWidget {
  const DeliverMap({super.key});

  @override
  State<DeliverMap> createState() => _DeliverMapState();
}

class _DeliverMapState extends State<DeliverMap> {
  final MapController mapController = getIt<MapController>();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: const LatLng(33.51380401351238, 36.27650992432078),
        initialZoom: 15,
        onTap: (tapPosition, point) {
          debugPrint('Lat: ${point.latitude}');
          debugPrint('Lon: ${point.longitude}');
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.deliver',
          // Use the recommended flutter_map_cancellable_tile_provider package to
          // support the cancellation of loading tiles.
          tileProvider: CancellableNetworkTileProvider(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../../../core/di/di.dart';
import '../bloc/map_bloc.dart';
import '../bloc/map_state.dart';
import '../widgets/deliver_map.dart';
import '../widgets/map_app_bar.dart';
import '../widgets/map_floating_action_button.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController mapController = getIt<MapController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DeliverMap(),
        const MapAppBar(),
        BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return MapFloatingActionButton(
              onPress: state.isLoading
                  ? null
                  : () {
                      context.read<MapBloc>().addGetCurrentLocation();
                    },
              icon: Icons.location_on_outlined,
              bottomPosition: 20,
              isLoading: state.isLoading,
            );
          },
        ),
        MapFloatingActionButton(
          onPress: () {},
          icon: Icons.add,
          bottomPosition: 90,
        ),
      ],
    );
  }
}

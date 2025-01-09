import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../bloc/map_bloc.dart';
import '../bloc/map_state.dart';
import '../widgets/deliver_map.dart';
import '../widgets/map_panel.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return SlidingUpPanel(
            controller: context.read<MapBloc>().panelController,
            minHeight: 80,
            maxHeight: 260,
            backdropEnabled: true,
            borderRadius: BorderRadius.circular(15),
            panel: MapPanel(
              startLocationInfo: state.startLocation,
              endLocationInfo: state.endLocation,
              isButtonEnable: state.startLocation != null,
              isPanelOpen: state.isPanelOpen,
              tripInfo: state.tripInfo,
              message: state.message,
              isLoading: state.isLoading,
            ),
            onPanelSlide: (position) {
              if (position >= 0.9) {
                context.read<MapBloc>().changeIsPanelOpenState(true);
              } else if (position <= 0.1) {
                context.read<MapBloc>().changeIsPanelOpenState(false);
              }
            },
            isDraggable: false,
            padding: EdgeInsets.all(15),
            body: DeliverMap(
              markers: state.markers.toSet(),
              isStartPoint: state.isStartPoint,
            ),
          );
        },
      ),
    );
  }
}

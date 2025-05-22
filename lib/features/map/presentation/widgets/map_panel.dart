import 'package:flutter/material.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/models/address.dart';
import '../../data/models/trip_distance_and_duration.dart';
import 'create_new_trip_form.dart';
import 'location_text.dart';
import 'map_collapsed_sliding_panel.dart';
import 'current_trip_details.dart';

class MapPanel extends StatelessWidget {
  final Address? startAddress;
  final Address? endAddress;
  final bool isButtonEnable;
  final bool isPanelOpen;
  final TripDistanceAndDuration? tripDistanceAndDuration;
  final String message;
  final bool isLoading;
  final Trip? currentTrip;

  const MapPanel({
    super.key,
    required this.startAddress,
    required this.endAddress,
    required this.isButtonEnable,
    required this.isPanelOpen,
    required this.tripDistanceAndDuration,
    required this.message,
    required this.isLoading,
    required this.currentTrip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isPanelOpen && message.isEmpty) ...[
          MapCollapsedSlidingPanel(
            isButtonEnable: isButtonEnable,
            currentTrip: currentTrip,
          ),
          const SizedBox(height: 10),
        ],
        if (!isPanelOpen && message.isNotEmpty) LocationText(message: message),
        if (isPanelOpen && currentTrip == null)
          Expanded(
            child: CreateNewTripForm(
              isLoading: isLoading,
              startAddress: startAddress,
              endAddress: endAddress,
              tripDistanceAndDuration: tripDistanceAndDuration,
            ),
          ),
        if (isPanelOpen && currentTrip != null)
          CurrentTripDetails(currentTrip: currentTrip!)
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/app_extensions.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/entities/trip.dart';
import '../../../../core/widget/trip_tile.dart';

class CurrentTripDetails extends StatelessWidget {
  final Trip currentTrip;

  const CurrentTripDetails({
    super.key,
    required this.currentTrip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripTile(
            title: S.of(context).tripNumber,
            subtitle: currentTrip.id.toString(),
          ),
          TripTile(
            title: S.of(context).status,
            subtitle: currentTrip.tripStatus.name,
          ),
          TripTile(
            title: S.of(context).estimatedTime,
            subtitle: S
                .of(context)
                .minute(currentTrip.calculatedDuration.removeDecimalZero()),
          ),
          TripTile(
            title: S.of(context).distance,
            subtitle: S
                .of(context)
                .km(currentTrip.calculatedDistance.removeDecimalZero()),
          ),
          TripTile(
            title: S.of(context).date,
            subtitle: currentTrip.createdDate,
          )
        ],
      ),
    );
  }
}

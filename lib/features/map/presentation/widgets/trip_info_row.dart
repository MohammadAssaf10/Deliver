import 'package:flutter/material.dart';

import '../../../../core/theming/styles_manager.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/trip_distance_and_duration.dart';

class TripInfoRow extends StatelessWidget {
  final TripDistanceAndDuration? tripDistanceAndDuration;

  const TripInfoRow({
    super.key,
    required this.tripDistanceAndDuration,
  });

  @override
  Widget build(BuildContext context) {
    return tripDistanceAndDuration == null
        ? SizedBox.shrink()
        : Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Wrap(
                children: [
                  Text(
                    S.of(context).estimatedTime,
                    style: TextStyles.font16BlackBold,
                  ),
                  Text(
                    S.of(context).minute(tripDistanceAndDuration!.duration),
                    style: TextStyles.font16BlackRegular,
                  ),
                  SizedBox(width: 20),
                  Text(
                    S.of(context).distance,
                    style: TextStyles.font16BlackBold,
                  ),
                  Text(
                    S.of(context).km(tripDistanceAndDuration!.distance),
                    style: TextStyles.font16BlackRegular,
                  ),
                ],
              ),
            ),
          );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/trip_distance_and_duration.dart';

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
                  CustomAutoSizeText(
                    text: S.of(context).estimatedTime,
                    minFontSize: 14,
                    initialFontSize: 16,
                    maxFontSize: 18,
                    color: ColorsManager.darkGrey,
                    fontWeight: FontWeightHelper.bold,
                  ),
                  CustomAutoSizeText(
                    text:
                        S.of(context).minute(tripDistanceAndDuration!.duration),
                    minFontSize: 14,
                    initialFontSize: 16,
                    maxFontSize: 18,
                    color: ColorsManager.darkGrey,
                  ),
                  SizedBox(width: 20),
                  CustomAutoSizeText(
                    text: S.of(context).distance,
                    minFontSize: 14,
                    initialFontSize: 16,
                    maxFontSize: 18,
                    color: ColorsManager.darkGrey,
                    fontWeight: FontWeightHelper.bold,
                  ),
                  CustomAutoSizeText(
                    text: S.of(context).km(tripDistanceAndDuration!.distance),
                    minFontSize: 14,
                    initialFontSize: 16,
                    maxFontSize: 18,
                    color: ColorsManager.darkGrey,
                  ),
                ],
              ),
            ),
          );
  }
}

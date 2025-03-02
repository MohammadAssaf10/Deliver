import 'package:flutter/material.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/font_manager.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../generated/l10n.dart';
import 'current_trip_card.dart';

class UserHaveTripWidget extends StatelessWidget {
  final Trip trip;

  const UserHaveTripWidget({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomAutoSizeText(
              text: S.of(context).currentTrip,
              minFontSize: 23,
              initialFontSize: 25,
              maxFontSize: 27,
              color: ColorsManager.darkWhite,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          CurrentTripCard(trip: trip),
        ],
      ),
    );
  }
}

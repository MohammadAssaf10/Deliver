import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/entities/trip.dart';
import 'current_trip_card.dart';
import '../../../../core/widget/trip_tile.dart';

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
            child: Text(
              S.of(context).currentTrip,
              style: TextStyles.font25DarkWhiteBold,
            ),
          ),
          CurrentTripCard(trip: trip),
        ],
      ),
    );
  }
}

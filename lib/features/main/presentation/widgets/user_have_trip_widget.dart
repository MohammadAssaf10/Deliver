import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../domain/entities/trip.dart';

class UserHaveTripWidget extends StatelessWidget {
  final Trip trip;

  const UserHaveTripWidget({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            Routes.mapPage,
            arguments: trip,
          );
        },
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorsManager.customPurple,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(trip.id.toString()),
                Text(trip.tripStatus.name),
                Text(trip.calculatedDuration.toString()),
                Text(trip.calculatedDistance.toString()),
                Text(trip.createdDate.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

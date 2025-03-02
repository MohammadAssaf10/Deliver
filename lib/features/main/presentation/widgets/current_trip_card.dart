import 'package:flutter/material.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/trip_tile.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class CurrentTripCard extends StatelessWidget {
  final Trip trip;

  const CurrentTripCard({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.mapPage,
          arguments: trip,
        );
      },
      child: Container(
        height: 215,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManager.customPurple,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              ColorsManager.customPurple.withValues(alpha: 0.9),
              ColorsManager.customPurple.withValues(alpha: 0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 13, end: 6, top: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    TripTile(
                      title: S.of(context).tripNumber,
                      subtitle: trip.id.toString(),
                      icon: Icons.confirmation_number_outlined,
                    ),
                    TripTile(
                      title: S.of(context).status,
                      subtitle: trip.tripStatus.name,
                      icon: Icons.info_outline,
                    ),
                    TripTile(
                      title: S.of(context).estimatedTime,
                      subtitle: S
                          .of(context)
                          .minute(trip.calculatedDuration.removeDecimalZero()),
                      icon: Icons.access_time,
                    ),
                    TripTile(
                      title: S.of(context).distance,
                      subtitle: S
                          .of(context)
                          .km(trip.calculatedDistance.removeDecimalZero()),
                      icon: Icons.directions_car,
                    ),
                    TripTile(
                      title: S.of(context).date,
                      subtitle: trip.createdDate,
                      icon: Icons.calendar_today,
                    )
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                Assets.imagesPickupImage,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width * 0.32,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

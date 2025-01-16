import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/entities/trip.dart';
import '../../../../core/widget/trip_tile.dart';

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
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: ColorsManager.customPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TripTile(
                    title: S.of(context).tripNumber,
                    subtitle: trip.id.toString(),
                  ),
                  TripTile(
                    title: S.of(context).status,
                    subtitle: trip.tripStatus.name,
                  ),
                  TripTile(
                    title: S.of(context).estimatedTime,
                    subtitle: S
                        .of(context)
                        .minute(trip.calculatedDuration.removeDecimalZero()),
                  ),
                  TripTile(
                    title: S.of(context).distance,
                    subtitle: S
                        .of(context)
                        .km(trip.calculatedDistance.removeDecimalZero()),
                  ),
                  TripTile(
                    title: S.of(context).date,
                    subtitle: trip.createdDate,
                  )
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                Assets.imagesPickupImage,
                fit: BoxFit.cover,
                // height: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}

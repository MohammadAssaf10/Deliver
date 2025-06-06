import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/trip_tile.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../bloc/map_bloc.dart';

class CurrentTripDetails extends StatelessWidget {
  final Trip currentTrip;

  const CurrentTripDetails({super.key, required this.currentTrip});

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
            icon: Icons.confirmation_number_outlined,
          ),
          TripTile(
            title: S.of(context).status,
            subtitle: currentTrip.tripStatus.name,
            icon: Icons.info_outline,
          ),
          TripTile(
            title: S.of(context).from,
            subtitle:
                '${currentTrip.pickUpAddress.administrativeArea}, ${currentTrip.pickUpAddress.locality}, ${currentTrip.pickUpAddress.street}',
            pngIcon: Assets.iconsStartLocation,
            subtitleMaxLine: 2,
          ),
          TripTile(
            title: S.of(context).to,
            subtitle:
                '${currentTrip.dropOffAddress.administrativeArea}, ${currentTrip.dropOffAddress.locality}, ${currentTrip.dropOffAddress.street}',
            pngIcon: Assets.iconsEndLocation,
            subtitleMaxLine: 2,
          ),
          TripTile(
            title: S.of(context).estimatedTime,
            subtitle: S
                .of(context)
                .minute(currentTrip.calculatedDuration.removeDecimalZero()),
            icon: Icons.access_time,
          ),
          TripTile(
            title: S.of(context).distance,
            subtitle: S
                .of(context)
                .km(currentTrip.calculatedDistance.removeDecimalZero()),
            icon: Icons.directions_car,
          ),
          TripTile(
            title: S.of(context).date,
            subtitle: currentTrip.createdDate,
            icon: Icons.calendar_today,
          ),
          const SizedBox(height: 5),
          AppTextButton(
            onPressed: () {
              context.read<MapBloc>().deleteCurrentTrip();
            },
            child: Text(
              S.of(context).cancelTrip,
              style: TextStyles.font16WhiteRegular,
            ),
          ),
        ],
      ),
    );
  }
}

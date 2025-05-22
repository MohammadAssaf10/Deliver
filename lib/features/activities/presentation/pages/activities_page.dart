import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/loader.dart';
import '../../../../core/widget/trip_tile.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../bloc/activities_bloc.dart';
import '../bloc/activities_state.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
      builder: (context, state) {
        return ListView.builder(
          controller: context.read<ActivitiesBloc>().controller,
          itemCount:
              state.tripHistories.isFinished || !state.tripHistories.isLoading
                  ? state.tripHistories.items.length
                  : state.tripHistories.items.length + 1,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          itemBuilder: (context, index) {
            return index >= state.tripHistories.items.length
                ? const Loader(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  color: ColorsManager.customWhite,
                )
                : Container(
                  height: 190,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 5),
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
                          padding: const EdgeInsetsDirectional.only(
                            start: 13,
                            end: 6,
                            top: 13,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              TripTile(
                                title: S.of(context).tripNumber,
                                subtitle:
                                    state.tripHistories.items[index].id
                                        .toString(),
                                icon: Icons.confirmation_number_outlined,
                              ),
                              TripTile(
                                title: S.of(context).status,
                                subtitle:
                                    state
                                        .tripHistories
                                        .items[index]
                                        .status
                                        .name,
                                icon: Icons.info_outline,
                              ),
                              TripTile(
                                title: S.of(context).estimatedTime,
                                subtitle: S
                                    .of(context)
                                    .minute(
                                      state
                                          .tripHistories
                                          .items[index]
                                          .calculatedDuration
                                          .removeDecimalZero(),
                                    ),
                                icon: Icons.access_time,
                              ),
                              TripTile(
                                title: S.of(context).distance,
                                subtitle: S
                                    .of(context)
                                    .km(
                                      state
                                          .tripHistories
                                          .items[index]
                                          .calculatedDistance
                                          .removeDecimalZero(),
                                    ),
                                icon: Icons.directions_car,
                              ),
                              TripTile(
                                title: S.of(context).date,
                                subtitle:
                                    state.tripHistories.items[index].createdDate
                                        .convertToStringDateTime(),
                                icon: Icons.calendar_today,
                              ),
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
                );
          },
        );
      },
    );
  }
}

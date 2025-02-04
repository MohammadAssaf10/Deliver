import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/address.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/trip_distance_and_duration.dart';
import '../bloc/map_bloc.dart';
import 'to_from_card.dart';
import 'trip_info_row.dart';

class CreateNewTripForm extends StatelessWidget {
  final Address? startAddress;
  final Address? endAddress;
  final TripDistanceAndDuration? tripDistanceAndDuration;
  final bool isLoading;

  const CreateNewTripForm({
    super.key,
    required this.startAddress,
    required this.endAddress,
    required this.tripDistanceAndDuration,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToFromCard(
          isStartPoint: true,
          title: S.of(context).from,
          address: startAddress,
        ),
        SizedBox(height: 15),
        ToFromCard(
          isStartPoint: false,
          title: S.of(context).to,
          address: endAddress,
        ),
        Expanded(
          child: TripInfoRow(
            tripDistanceAndDuration: tripDistanceAndDuration,
          ),
        ),
        isLoading
            ? Loader(size: 45)
            : Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                          onPressed: () {
                            context.read<MapBloc>().panelController.close();
                            context
                                .read<MapBloc>()
                                .changeIsPanelOpenState(false);
                            context.read<MapBloc>().setHintMessage("");
                          },
                          buttonHeight: 48,
                          borderRadius: 15,
                          backgroundColor: ColorsManager.white,
                          borderSide: BorderSide(
                            width: 2,
                            color: ColorsManager.darkGrey,
                          ),
                          child: CustomAutoSizeText(
                            text: S.of(context).cancel,
                            minFontSize: 14,
                            initialFontSize: 16,
                            maxFontSize: 18,
                            color: ColorsManager.darkGrey,
                          )),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: AppTextButton(
                        onPressed: startAddress == null || endAddress == null
                            ? null
                            : () {
                                context.read<MapBloc>().createNewTrip();
                              },
                        backgroundColor:
                            startAddress == null || endAddress == null
                                ? ColorsManager.darkWhite
                                : ColorsManager.darkGrey,
                        buttonHeight: 48,
                        borderRadius: 15,
                        child: CustomAutoSizeText(
                          text: S.of(context).confirm,
                          minFontSize: 14,
                          initialFontSize: 16,
                          maxFontSize: 18,
                          color: startAddress == null || endAddress == null
                              ? ColorsManager.darkGrey
                              : ColorsManager.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        SizedBox(height: 30),
      ],
    );
  }
}

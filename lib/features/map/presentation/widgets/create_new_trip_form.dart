import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/address.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
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
                          context.read<MapBloc>().changeIsPanelOpenState(false);
                          context.read<MapBloc>().setHintMessage("");
                        },
                        buttonText: S.of(context).cancel,
                        buttonHeight: 48,
                        borderRadius: 15,
                        backgroundColor: ColorsManager.white,
                        borderSide: BorderSide(
                          width: 2,
                          color: ColorsManager.darkGrey,
                        ),
                        textStyle: TextStyles.font16DarkGreyRegular,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: AppTextButton(
                        onPressed: () {
                          context.read<MapBloc>().createNewTrip();
                        },
                        buttonText: S.of(context).confirm,
                        buttonHeight: 48,
                        borderRadius: 15,
                        textStyle: TextStyles.font16WhiteRegular,
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

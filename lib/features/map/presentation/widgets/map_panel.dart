import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/address.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/trip_distance_and_duration.dart';
import '../bloc/map_bloc.dart';
import 'location_text.dart';
import 'map_collapsed_sliding_panel.dart';
import 'to_from_card.dart';
import 'trip_info_row.dart';

class MapPanel extends StatelessWidget {
  final Address? startAddress;
  final Address? endAddress;
  final bool isButtonEnable;
  final bool isPanelOpen;
  final TripDistanceAndDuration? tripDistanceAndDuration;
  final String message;
  final bool isLoading;

  const MapPanel({
    super.key,
    required this.startAddress,
    required this.endAddress,
    required this.isButtonEnable,
    required this.isPanelOpen,
    required this.tripDistanceAndDuration,
    required this.message,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isPanelOpen && message.isEmpty) ...[
          MapCollapsedSlidingPanel(
            isButtonEnable: isButtonEnable,
          ),
          SizedBox(height: 10),
        ],
        if (!isPanelOpen && message.isNotEmpty) LocationText(message: message),
        if (isPanelOpen) ...[
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
                          buttonText: S.of(context).cancel,
                          buttonHeight: 48,
                          borderRadius: 15,
                          backgroundColor: ColorsManager.white,
                          borderSide: BorderSide(
                            width: 2,
                            color: ColorsManager.darkGrey,
                          ),
                          textStyle: TextStyles.font16BlackRegular,
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
        ]
      ],
    );
  }
}

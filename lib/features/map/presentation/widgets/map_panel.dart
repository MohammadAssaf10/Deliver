import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/location_info.dart';
import '../../domain/entities/trip_info.dart';
import '../bloc/map_bloc.dart';
import 'location_text.dart';
import 'map_collapsed_sliding_panel.dart';
import 'to_from_card.dart';
import 'trip_info_row.dart';

class MapPanel extends StatelessWidget {
  final LocationInfo? startLocationInfo;
  final LocationInfo? endLocationInfo;
  final bool isButtonEnable;
  final bool isPanelOpen;
  final TripInfo? tripInfo;
  final String message;
  final bool isLoading;

  const MapPanel({
    super.key,
    required this.startLocationInfo,
    required this.endLocationInfo,
    required this.isButtonEnable,
    required this.isPanelOpen,
    required this.tripInfo,
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
            locationInfo: startLocationInfo,
          ),
          SizedBox(height: 15),
          ToFromCard(
            isStartPoint: false,
            title: S.of(context).to,
            locationInfo: endLocationInfo,
          ),
          Expanded(
            child: TripInfoRow(
              tripInfo: tripInfo,
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

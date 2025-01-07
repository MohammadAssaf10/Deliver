import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../domain/entities/distance.dart';
import '../../domain/entities/location_info.dart';
import '../bloc/map_bloc.dart';
import 'location_text.dart';
import 'map_collapsed_sliding_panel.dart';
import 'to_from_card.dart';
import 'trip_info.dart';

class MapPanel extends StatelessWidget {
  final LocationInfo? startLocationInfo;
  final LocationInfo? endLocationInfo;
  final bool isButtonEnable;
  final bool isPanelOpen;
  final Distance? distance;
  final String message;

  const MapPanel({
    super.key,
    required this.startLocationInfo,
    required this.endLocationInfo,
    required this.isButtonEnable,
    required this.isPanelOpen,
    required this.distance,
    required this.message,
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
            title: "From",
            locationInfo: startLocationInfo,
          ),
          SizedBox(height: 15),
          ToFromCard(
            isStartPoint: false,
            title: "To",
            locationInfo: endLocationInfo,
          ),
          TripInfo(
            distance: distance,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  onPressed: () {
                    context.read<MapBloc>().panelController.close();
                    context.read<MapBloc>().changeIsPanelOpenState(false);
                    context.read<MapBloc>().setHintMessage("");
                  },
                  buttonText: "Back",
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
                  onPressed: () {},
                  buttonText: "Confirm",
                  buttonHeight: 48,
                  borderRadius: 15,
                  textStyle: TextStyles.font16WhiteRegular,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
        ]
      ],
    );
  }
}

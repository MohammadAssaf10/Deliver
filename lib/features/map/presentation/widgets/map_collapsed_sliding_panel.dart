import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/entities/trip.dart';
import '../bloc/map_bloc.dart';

class MapCollapsedSlidingPanel extends StatelessWidget {
  final bool isButtonEnable;
  final Trip? currentTrip;

  const MapCollapsedSlidingPanel({
    super.key,
    required this.isButtonEnable,
    required this.currentTrip,
  });

  @override
  Widget build(BuildContext context) {
    return currentTrip == null
        ? AppTextButton(
            onPressed: () {
              if (isButtonEnable) {
                context.read<MapBloc>().panelController.open();
              } else {
                context.read<MapBloc>().getCurrentLocation();
              }
            },
            buttonText: S.of(context).orderNow,
            buttonHeight: 48,
            borderRadius: 15,
            outerHorizontalPadding: 20,
            backgroundColor: isButtonEnable
                ? ColorsManager.darkGrey
                : ColorsManager.darkWhite,
            textStyle: isButtonEnable
                ? TextStyles.font16WhiteRegular
                : TextStyles.font16DarkGreyRegular,
          )
        : AppTextButton(
            onPressed: () {
              context.read<MapBloc>().panelController.open();
            },
            buttonText: S.of(context).showTripDetails,
            buttonHeight: 48,
            borderRadius: 15,
            outerHorizontalPadding: 20,
            textStyle: TextStyles.font16WhiteRegular,
          );
  }
}

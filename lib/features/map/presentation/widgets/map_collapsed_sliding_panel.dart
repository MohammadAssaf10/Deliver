import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/custom_auto_size_text.dart';
import '../../../../generated/l10n.dart';
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
            buttonHeight: 48,
            borderRadius: 15,
            outerPadding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: isButtonEnable
                ? ColorsManager.darkGrey
                : ColorsManager.darkWhite,
            child: CustomAutoSizeText(
              text: S.of(context).orderNow,
              minFontSize: 14,
              initialFontSize: 16,
              maxFontSize: 18,
              color:
                  isButtonEnable ? ColorsManager.white : ColorsManager.darkGrey,
            ),
          )
        : AppTextButton(
            onPressed: () {
              context.read<MapBloc>().panelController.open();
            },
            buttonHeight: 48,
            borderRadius: 15,
            outerPadding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomAutoSizeText(
              text: S.of(context).showTripDetails,
              minFontSize: 14,
              initialFontSize: 16,
              maxFontSize: 18,
              color: ColorsManager.white,
            ),
          );
  }
}

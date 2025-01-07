import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widget/app_text_button.dart';
import '../bloc/map_bloc.dart';

class MapCollapsedSlidingPanel extends StatelessWidget {
  final bool isButtonEnable;

  const MapCollapsedSlidingPanel({
    super.key,
    required this.isButtonEnable,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () {
        if (isButtonEnable) {
          context.read<MapBloc>().panelController.open();
        } else {
          context.read<MapBloc>().getCurrentLocation();
        }
      },
      buttonText: "Order now",
      buttonHeight: 48,
      borderRadius: 15,
      outerHorizontalPadding: 20,
      backgroundColor:
          isButtonEnable ? ColorsManager.darkGrey : ColorsManager.darkWhite,
      textStyle: isButtonEnable
          ? TextStyles.font16WhiteRegular
          : TextStyles.font16BlackRegular,
    );
  }
}

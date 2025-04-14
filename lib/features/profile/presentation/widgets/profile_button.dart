import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widget/app_text_button.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const ProfileButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: onPressed,
      alignment: AlignmentDirectional.centerStart,
      backgroundColor: ColorsManager.lightBlack,
      outerPadding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: TextStyles.font14LightGreyMedium,
      ),
    );
  }
}

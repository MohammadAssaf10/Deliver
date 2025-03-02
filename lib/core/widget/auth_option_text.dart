import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';
import '../theming/font_manager.dart';
import 'custom_auto_size_text.dart';

class AuthOptionText extends StatelessWidget {
  const AuthOptionText({
    super.key,
    required this.title,
    required this.subTitle,
    required this.subTitleOnPress,
  });

  final String title;
  final String subTitle;
  final Function subTitleOnPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 2,
          child: CustomAutoSizeText(
            text: title,
            minFontSize: 12,
            initialFontSize: 14,
            maxFontSize: 16,
            color: ColorsManager.grey,
          ),
        ),
        const SizedBox(width: 3),
        Flexible(
          child: GestureDetector(
            onTap: () {
              subTitleOnPress();
            },
            child: CustomAutoSizeText(
              text: subTitle,
              minFontSize: 12,
              initialFontSize: 14,
              maxFontSize: 16,
              color: ColorsManager.darkGrey,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ],
    );
  }
}

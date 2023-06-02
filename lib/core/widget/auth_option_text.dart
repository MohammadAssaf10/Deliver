import 'package:flutter/material.dart';

import '../../../../config/color_manager.dart';
import '../../config/styles_manager.dart';

class AuthOptionText extends StatelessWidget {
  const AuthOptionText({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.subTitleOnPress,
  }) : super(key: key);
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
          child: Text(
            title,
            style: getRegularStyle(
              fontSize: 16,
              color: ColorManager.grey,
            ),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              subTitleOnPress();
            },
            child: Text(
              subTitle,
              style: getRegularStyle(
                fontSize: 16,
                color: ColorManager.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

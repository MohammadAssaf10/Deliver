import 'package:flutter/material.dart';

import '../theming/styles_manager.dart';

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
          child: Text(
            title,
            style: TextStyles.font14GreyRegular,
          ),
        ),
        const SizedBox(width: 3),
        Flexible(
          child: GestureDetector(
            onTap: () {
              subTitleOnPress();
            },
            child: Text(
              subTitle,
              style: TextStyles.font14BlackBold,
            ),
          ),
        ),
      ],
    );
  }
}

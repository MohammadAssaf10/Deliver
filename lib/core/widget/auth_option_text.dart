import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';
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
            style: TextStyles.font16GreyRegular,
          ),
        ),
        const SizedBox(width: 3),
        Flexible(
          child: GestureDetector(
            onTap: () {
              subTitleOnPress();
            },
            child: IntrinsicWidth(
              child: Column(
                children: [
                  Text(
                    subTitle,
                    style: TextStyles.font16BlackRegular,
                  ),
                  const Divider(
                    height: 0,
                    color: ColorsManager.black,
                    thickness: 1.2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

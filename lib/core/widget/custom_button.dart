import 'package:flutter/material.dart';

import '../../config/color_manager.dart';
import '../../config/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPress,
    required this.titleColor,
  }) : super(key: key);
  final String title;
  final Function onPress;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPress();
      },
      child: Text(
        title,
        style: getBoldStyle(
          fontSize: 22,
          color: titleColor,
        ),
      ),
    );
  }
}

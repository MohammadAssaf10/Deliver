import 'package:flutter/material.dart';

import '../theming/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.titleColor,
  });
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
        style: TextStyles.font21WhiteBold,
      ),
    );
  }
}

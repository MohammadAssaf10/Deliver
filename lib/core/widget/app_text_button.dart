import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? overlayColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String? buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Widget? child;
  final BorderSide borderSide;
  final double? outerVerticalPadding;
  final double? outerHorizontalPadding;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.overlayColor,
    this.outerHorizontalPadding,
    this.buttonHeight,
    this.buttonWidth,
    this.child,
    this.buttonText,
    this.textStyle,
    this.outerVerticalPadding,
    this.borderSide = BorderSide.none,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: outerVerticalPadding ?? 0,
        horizontal: outerHorizontalPadding ?? 0,
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
              side: borderSide,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? ColorsManager.darkGrey,
          ),
          fixedSize: WidgetStateProperty.all(
            Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50),
          ),
          overlayColor: WidgetStateProperty.all(
            overlayColor ?? ColorsManager.grey.withOpacity(0.03),
          ),
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              buttonText ?? "",
              style: textStyle,
            ),
      ),
    );
  }
}

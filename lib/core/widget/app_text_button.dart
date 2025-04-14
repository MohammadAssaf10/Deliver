import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color backgroundColor;
  final Color? overlayColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback? onPressed;
  final Widget child;
  final BorderSide borderSide;
  final EdgeInsetsGeometry outerPadding;
  final AlignmentGeometry? alignment;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor = ColorsManager.darkGrey,
    this.overlayColor,
    this.outerPadding = EdgeInsets.zero,
    this.buttonHeight,
    this.buttonWidth,
    required this.child,
    this.borderSide = BorderSide.none,
    required this.onPressed,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
              side: borderSide,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor,
          ),
          fixedSize: WidgetStateProperty.all(
            Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 45),
          ),
          overlayColor: WidgetStateProperty.all(
            overlayColor ?? ColorsManager.grey.withValues(alpha: 0.03),
          ),
          alignment: alignment,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

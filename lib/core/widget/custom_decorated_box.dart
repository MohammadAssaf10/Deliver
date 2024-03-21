import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';

class CustomDecoratedBox extends StatelessWidget {
  const CustomDecoratedBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            ColorsManager.secondPrimary,
            ColorsManager.primary,
            ColorsManager.secondPrimary,
          ],
        ),
      ),
      child: child,
    );
  }
}

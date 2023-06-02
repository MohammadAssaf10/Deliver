import 'package:flutter/material.dart';

import '../../config/color_manager.dart';

class CustomDecoratedBox extends StatelessWidget {
  const CustomDecoratedBox({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            ColorManager.secondPrimary,
            ColorManager.primary,
            ColorManager.secondPrimary,
          ],
        ),
      ),
      child: child,
    );
  }
}

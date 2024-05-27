import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/loader.dart';

class MapFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPress;
  final double bottomPosition;
  final double endPosition;
  final bool isLoading;

  const MapFloatingActionButton({
    super.key,
    required this.icon,
    required this.onPress,
    required this.bottomPosition,
    this.endPosition = 15,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: bottomPosition,
      end: endPosition,
      child: FloatingActionButton(
        onPressed: onPress,
        backgroundColor: ColorsManager.primary,
        child: isLoading
            ? const Loader(
                color: ColorsManager.white,
              )
            : Icon(
                icon,
                size: 30,
                color: ColorsManager.white,
              ),
      ),
    );
  }
}

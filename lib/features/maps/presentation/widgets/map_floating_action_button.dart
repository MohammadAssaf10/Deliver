import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widget/loader.dart';

class MapFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPress;
  final bool isLoading;

  const MapFloatingActionButton({
    super.key,
    required this.icon,
    required this.onPress,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      backgroundColor: ColorsManager.black,
      child: isLoading
          ? const Loader(
              color: ColorsManager.white,
            )
          : Icon(
              icon,
              size: 30,
              color: ColorsManager.white,
            ),
    );
  }
}

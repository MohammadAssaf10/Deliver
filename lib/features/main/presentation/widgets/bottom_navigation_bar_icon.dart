import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';

class BottomNavigationBarIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onPress;

  const BottomNavigationBarIcon({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        onPressed: onPress,
        icon: Column(
          children: [
            Icon(
              icon,
              color: title == 'Home' ? ColorsManager.black : ColorsManager.grey,
            ),
            Text(
              title,
              style: TextStyle(
                color:
                    title == 'Home' ? ColorsManager.black : ColorsManager.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

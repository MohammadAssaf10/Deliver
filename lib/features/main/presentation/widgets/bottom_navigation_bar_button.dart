import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';

class BottomNavigationBarButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onPress;

  const BottomNavigationBarButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          children: [
            Expanded(
              child: Icon(
                icon,
                color: ColorsManager.lightGrey,
                size: 27,
              ),
            ),
            Text(
              title,
              style: TextStyles.font13LightGreyRegular,
            ),
            const SizedBox(height: 6)
          ],
        ),
      ),
    );
  }
}

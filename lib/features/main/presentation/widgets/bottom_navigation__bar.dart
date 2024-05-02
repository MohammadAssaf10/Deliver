import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import 'bottom_navigation_bar_icon.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: ColorsManager.textFieldBackgroundColor,
        boxShadow: [
          BoxShadow(
              color: ColorsManager.grey,
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomNavigationBarIcon(
            onPress: () {},
            title: 'Home',
            icon: Icons.home,
          ),
          BottomNavigationBarIcon(
            onPress: () {},
            title: 'Trips log',
            icon: Icons.history,
          ),
          BottomNavigationBarIcon(
            onPress: () {},
            title: 'Home',
            icon: Icons.home,
          ),
          BottomNavigationBarIcon(
            onPress: () {},
            title: 'Home',
            icon: Icons.home,
          ),
          BottomNavigationBarIcon(
            onPress: () {},
            title: 'Settings',
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}

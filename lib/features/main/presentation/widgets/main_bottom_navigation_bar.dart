import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import 'bottom_navigation_bar_button.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorsManager.lightBlack,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomNavigationBarButton(
            onPress: () {},
            title: 'Home',
            icon: Icons.home,
          ),
          BottomNavigationBarButton(
            onPress: () {},
            title: 'Services',
            icon: Icons.apps,
          ),
          BottomNavigationBarButton(
            onPress: () {},
            title: "Activity",
            icon: Icons.list_alt,
          ),
          BottomNavigationBarButton(
            onPress: () {},
            title: 'Account',
            icon: Icons.person,
          ),
        ],
      ),
    );
  }
}

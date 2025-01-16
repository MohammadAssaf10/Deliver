import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../generated/l10n.dart';
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
            index: 0,
            title: S.of(context).home,
            icon: Icons.home,
          ),
          BottomNavigationBarButton(
            index: 1,
            title: S.of(context).services,
            icon: Icons.apps,
          ),
          BottomNavigationBarButton(
            index: 2,
            title: S.of(context).activities,
            icon: Icons.list_alt,
          ),
          BottomNavigationBarButton(
            index: 3,
            title: S.of(context).account,
            icon: Icons.person,
          ),
        ],
      ),
    );
  }
}

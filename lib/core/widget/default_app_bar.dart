import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          margin: const EdgeInsetsDirectional.only(
            start: 15,
            end: 15,
            bottom: 15,
          ),
          alignment: AlignmentDirectional.centerStart,
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorsManager.darkWhite)),
          ),
          child: Text(title, style: TextStyles.font33DarkWhiteBold),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

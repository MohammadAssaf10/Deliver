import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../generated/l10n.dart';

class OrBar extends StatelessWidget {
  const OrBar({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: ColorsManager.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              S.of(context).or,
              style: TextStyles.font14GreyRegular,
            ),
          ),
          const Expanded(
            child: Divider(
              color: ColorsManager.grey,
            ),
          ),
        ],
      ),
    );
  }
}

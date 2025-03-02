import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../theming/colors_manager.dart';
import 'custom_auto_size_text.dart';

class OrBar extends StatelessWidget {
  const OrBar({super.key});

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
            child: CustomAutoSizeText(
              text: S.of(context).or,
              minFontSize: 12,
              initialFontSize: 14,
              maxFontSize: 16,
              color: ColorsManager.darkGrey,
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

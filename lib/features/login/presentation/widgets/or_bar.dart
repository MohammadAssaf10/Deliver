import 'package:flutter/material.dart';

import '../../../../config/color_manager.dart';
import '../../../../config/styles_manager.dart';
import '../../../../generated/l10n.dart';

class OrBar extends StatelessWidget {
  const OrBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: ColorManager.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              S.of(context).or,
              style: getRegularStyle(
                fontSize: 14,
                color: ColorManager.grey,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: ColorManager.grey,
            ),
          ),
        ],
      ),
    );
  }
}

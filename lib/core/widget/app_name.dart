import 'package:flutter/material.dart';

import '../../config/color_manager.dart';
import '../../config/styles_manager.dart';
import '../../generated/l10n.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).deliver,
        style: getBoldStyle(
          fontSize: 22,
          color: ColorManager.black,
        ),
      ),
    );
  }
}

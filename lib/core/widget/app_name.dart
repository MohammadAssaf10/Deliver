import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../theming/styles_manager.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).deliver,
        style: TextStyles.font22BlackBold,
      ),
    );
  }
}

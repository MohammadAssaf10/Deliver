import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../theming/styles_manager.dart';

class AppName extends StatelessWidget {
  final TextStyle? textStyle;

  const AppName({
    super.key,
    this.textStyle = TextStyles.font22BlackBold,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).deliver,
        style: textStyle,
      ),
    );
  }
}

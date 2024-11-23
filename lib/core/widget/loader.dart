import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theming/colors_manager.dart';

class Loader extends StatelessWidget {
  final Color? color;
  final double size;

  const Loader({
    super.key,
    this.color = ColorsManager.black,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: color,
        size: size,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theming/colors_manager.dart';

class Loader extends StatelessWidget {
  final Color? color;
  final double size;
  final EdgeInsetsGeometry padding;

  const Loader({
    super.key,
    this.color = ColorsManager.darkGrey,
    this.size = 30,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: SpinKitFadingCircle(
          color: color,
          size: size,
        ),
      ),
    );
  }
}

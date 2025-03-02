import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../theming/font_manager.dart';

class CustomAutoSizeText extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final double? initialFontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontStyle? fontStyle;

  final TextOverflow? overflow;

  const CustomAutoSizeText({
    super.key,
    required this.text,
    this.minFontSize = 12,
    required this.maxFontSize,
    this.initialFontSize,
    this.color,
    this.fontWeight = FontWeightHelper.regular,
    this.textAlign,
    this.maxLines,
    this.fontStyle,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = MediaQuery.sizeOf(context).width * 0.025;
    return AutoSizeText(
      text,
      style: TextStyle(
        fontSize: initialFontSize ?? fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        overflow: overflow,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      overflow: overflow,
    );
  }
}

import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// Regular style
TextStyle getRegularStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.regular, color, FontConstants.almaraiFamily);
}

// SemiBold style
TextStyle getSemiBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.semiBold, color, FontConstants.almaraiFamily);
}

// Bold style
TextStyle getBoldStyle({required double fontSize, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.bold, color, FontConstants.almaraiFamily);
}

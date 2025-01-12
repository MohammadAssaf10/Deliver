import 'package:flutter/material.dart';

import 'app_enums.dart';
import 'app_regex.dart';

extension NullOrEmpty on String? {
  bool nullOrEmpty() {
    if (this == null || this!.isEmpty) return true;
    return false;
  }
}

extension ChangePrintedStringColor on String {
  String withColor(StringColor? color) {
    switch (color) {
      case StringColor.black:
        return '\x1B[30m$this\x1B[0m';
      case StringColor.red:
        return '\x1B[31m$this\x1B[0m';
      case StringColor.green:
        return '\x1B[32m$this\x1B[0m';
      case StringColor.yellow:
        return '\x1B[33m$this\x1B[0m';
      case StringColor.blue:
        return '\x1B[34m$this\x1B[0m';
      case StringColor.magenta:
        return '\x1B[35m$this\x1B[0m';
      case StringColor.cyan:
        return '\x1B[36m$this\x1B[0m';
      case StringColor.white:
        return '\x1B[37m$this\x1B[0m';
      default:
        return this;
    }
  }
}

extension RemoveDecimalZero on double {
  String removeDecimalZero() {
    return toString().replaceAll(AppRegex.decimalZeroRegExp, '');
  }
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

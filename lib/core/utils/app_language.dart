import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_enums.dart';

class AppLanguage {
  AppLanguage._();

  static bool isEnglishLocale(BuildContext context) =>
      Localizations.localeOf(context).languageCode == Language.en.name;

  static Language getDeviceLanguage() {
    final Locale deviceLocale = PlatformDispatcher.instance.locale;
    final String deviceLanguage = deviceLocale.languageCode;
    if (deviceLanguage == Language.en.name) {
      return Language.en;
    } else {
      return Language.ar;
    }
  }
}

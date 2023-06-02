import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/di.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";
const String arabicLanguage = 'Arabic';
const String englishLanguage = 'English';
const Locale arabicLocale = Locale("ar");
const Locale englishLocale = Locale("en");

Locale getLocal() {
  final String? language = getIt<SharedPreferences>().getString(prefsKeyLang);
  if (language == arabicLanguage) {
    return arabicLocale;
  } else {
    return englishLocale;
  }
}

bool isLanguageEnglish() {
  if (getLocal() == englishLocale) {
    return true;
  } else {
    return false;
  }
}

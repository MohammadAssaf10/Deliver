import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/di.dart';
import '../language.dart';

part 'language_state.dart';

@lazySingleton
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState());

  void setArabic() {
    getIt<SharedPreferences>().setString(prefsKeyLang, arabicLanguage);
    emit(const LanguageState(locale: arabicLocale));
  }

  void setEnglish() {
    getIt<SharedPreferences>().setString(prefsKeyLang, englishLanguage);
    emit(const LanguageState(locale: englishLocale));
  }
}

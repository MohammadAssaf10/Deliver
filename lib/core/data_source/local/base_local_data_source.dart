import '../../utils/app_enums.dart';

abstract class BaseLocalDataSource {
  Future<Language> getAppLanguage();

  Future<void> setAppLanguage(Language language);
}

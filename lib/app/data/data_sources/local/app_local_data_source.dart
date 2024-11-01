import '../../../../core/utils/app_enums.dart';

abstract class AppLocalDataSource {
  Future<Language> getAppLanguage();
}

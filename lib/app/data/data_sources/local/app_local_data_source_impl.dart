import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_language.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import 'app_local_data_source.dart';

@LazySingleton(as: AppLocalDataSource)
class AppLocalDataSourceImpl implements AppLocalDataSource {
  @override
  Future<Language> getAppLanguage() async {
    final String storedLanguage =
        SharedPreferencesHelper.getString(LocalStorageKeys.appLanguage);
    if (storedLanguage.isEmpty) {
      final Language deviceLanguage = AppLanguage.getDeviceLanguage();
      await setAppLanguage(deviceLanguage);
      return deviceLanguage;
    } else {
      if (storedLanguage == Language.en.name) {
        return Language.en;
      } else {
        return Language.ar;
      }
    }
  }

  @override
  Future<void> setAppLanguage(Language language) async {
    await SharedPreferencesHelper.setData(
        LocalStorageKeys.appLanguage, language.name);
  }
}

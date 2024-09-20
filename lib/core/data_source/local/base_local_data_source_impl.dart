import 'package:injectable/injectable.dart';

import '../../utils/app_enums.dart';
import '../../utils/app_language.dart';
import '../../utils/constant.dart';
import '../../utils/shared_preferences_helper.dart';
import 'base_local_data_source.dart';

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImpl implements BaseLocalDataSource {
  @override
  Future<Language> getAppLanguage() async {
    final String storedLanguage =
    SharedPreferencesHelper.getString(LocalStorageKeys.appLanguage);
    if (storedLanguage.isEmpty) {
      final Language deviceLanguage = AppLanguage.getDeviceLanguage();
      await SharedPreferencesHelper.setData(
          LocalStorageKeys.appLanguage, deviceLanguage.name);
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

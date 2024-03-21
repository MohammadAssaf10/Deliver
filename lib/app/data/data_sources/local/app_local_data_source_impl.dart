import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/constant.dart';
import 'app_local_data_source.dart';

@LazySingleton(as: AppLocalDataSource)
class AppLocalDataSourceImpl extends AppLocalDataSource {
  final SharedPreferences sharedPreferences;

  AppLocalDataSourceImpl(this.sharedPreferences);

  @override
  String get appLanguage =>
      sharedPreferences.getString(SharedPreferencesKeys.appLanguage) ?? 'en';

  @override
  Future<void> setAppLanguage(String language) async {
    await sharedPreferences.setString(
      SharedPreferencesKeys.appLanguage,
      language,
    );
  }
}

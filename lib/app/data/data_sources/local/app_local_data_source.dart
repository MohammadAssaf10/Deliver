abstract class AppLocalDataSource{
  String get appLanguage;
  Future<void> setAppLanguage(String language);
}
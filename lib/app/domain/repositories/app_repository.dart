abstract class AppRepository {
  String getAppLanguage();

  Future<void> setAppLanguage(String language);
}
import 'package:injectable/injectable.dart';

import '../../domain/repositories/app_repository.dart';
import '../data_sources/local/app_local_data_source.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl extends AppRepository {
  final AppLocalDataSource _localDataSource;

  AppRepositoryImpl(this._localDataSource);

  @override
  String getAppLanguage() => _localDataSource.appLanguage;

  @override
  Future<void> setAppLanguage(String language) async =>
      await _localDataSource.setAppLanguage(language);
}

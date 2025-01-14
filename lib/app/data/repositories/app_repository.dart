import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_preferences_helper.dart';
import '../data_sources/local/app_local_data_source.dart';

@lazySingleton
class AppRepository {
  final AppLocalDataSource _localDataSource;

  AppRepository(this._localDataSource);

  Future<Either<Failure, Language>> getAppLanguage() async {
    try {
      final result = await _localDataSource.getAppLanguage();
      return Right(result);
    } catch (e) {
      return const Left(CacheFailure(errorMessage: "Can't get app Language"));
    }
  }

  Future<Either<Failure, void>> setAppLanguage(Language language) async {
    try {
      await SharedPreferencesHelper.setData(
        LocalStorageKeys.appLanguage,
        language.name,
      );
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure(errorMessage: "Can't get app Language"));
    }
  }
}

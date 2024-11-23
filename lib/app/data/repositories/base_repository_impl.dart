import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/dio_factory.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/shared_preferences_helper.dart';
import '../data_sources/local/app_local_data_source.dart';
import '../../../core/error/failures.dart';
import '../../../core/utils/app_enums.dart';
import '../../domain/repositories/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final AppLocalDataSource _baseLocalDataSource;

  AppRepositoryImpl(
    this._baseLocalDataSource,
  );

  @override
  Future<Either<Failure, Language>> getAppLanguage() async {
    try {
      final Language result = await _baseLocalDataSource.getAppLanguage();
      DioFactory.setNewLanguageAfterChanged(result);
      return Right(result);
    } catch (e) {
      return const Left(CacheFailure(errorMessage: "Can't get app language"));
    }
  }

  @override
  Future<Either<Failure, void>> setAppLanguage(Language language) async {
    try {
      await SharedPreferencesHelper.setData(
          LocalStorageKeys.appLanguage, language.name);
      return const Right(null);
    } catch (e) {
      return const Left(
        CacheFailure(errorMessage: "Save language in shared preferences fail"),
      );
    }
  }
}

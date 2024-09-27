import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/local/app_local_data_source.dart';
import '../../../core/error/failure.dart';
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
      return Right(result);
    } catch (e) {
      return const Left(CacheFailure(errorMessage: "Can't get app language"));
    }
  }

  @override
  Future<Either<Failure, void>> setAppLanguage(Language language) async {
    try {
      await _baseLocalDataSource.setAppLanguage(language);
      return const Right(null);
    } catch (e) {
      return const Left(
        CacheFailure(errorMessage: "Save language in shared preferences fail"),
      );
    }
  }
}

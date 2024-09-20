import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../data_source/local/base_local_data_source.dart';
import '../error/failure.dart';
import '../utils/app_enums.dart';
import 'base_repository.dart';

@LazySingleton(as: BaseRepository)
class BaseRepositoryImpl implements BaseRepository {
  final BaseLocalDataSource _baseLocalDataSource;

  BaseRepositoryImpl(this._baseLocalDataSource,);

  @override
  Future<Either<Failure, Language>> getAppLanguage() async {
    try {
      final Language result = await _baseLocalDataSource.getAppLanguage();
      return Right(result);
    } catch (e) {
      return const Left(CacheFailure(error: "Can't get app language"));
    }
  }

  @override
  Future<Either<Failure, void>> setAppLanguage(Language language) async {
    try {
      await _baseLocalDataSource.setAppLanguage(language);
      return const Right(null);
    } catch (e) {
      return const Left(
        CacheFailure(error: "Save language in shared preferences fail"),
      );
    }
  }
}
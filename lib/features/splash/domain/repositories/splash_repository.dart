import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';

abstract class SplashRepository extends BaseRepository {
  Future<Either<Failure, bool>> isUserAuthenticated();

  Future<Either<Failure, bool>> tokenNeedRefresh();
}

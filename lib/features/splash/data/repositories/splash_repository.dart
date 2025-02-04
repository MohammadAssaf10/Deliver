import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';

@lazySingleton
class SplashRepository extends BaseRepository {
  Future<Either<Failure, bool>> isUserAuthenticated() async {
    try {
      final String userToken = await SharedPreferencesHelper.getSecuredString(
          LocalStorageKeys.userToken);
      return Right(userToken.isNotEmpty);
    } catch (e) {
      return const Left(
        CacheFailure(errorMessage: "Can't get user token"),
      );
    }
  }
}

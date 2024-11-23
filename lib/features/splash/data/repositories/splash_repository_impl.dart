import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:ntp/ntp.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../domain/repositories/splash_repository.dart';

@LazySingleton(as: SplashRepository)
class SplashRepositoryImpl extends BaseRepositoryImpl
    implements SplashRepository {
  @override
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

  @override
  Future<Either<Failure, bool>> tokenNeedRefresh() async {
    try {
      final String loggedInDate =
          SharedPreferencesHelper.getString(LocalStorageKeys.loggedInDate);
      final DateTime nowDateTime =
          await NTP.now(lookUpAddress: 'time.windows.com');
      final Duration diff =
          nowDateTime.difference(DateTime.parse(loggedInDate));
      if (diff.inSeconds >= 3600) {
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      return const Left(
        CacheFailure(errorMessage: "Can't get user token"),
      );
    }
  }
}

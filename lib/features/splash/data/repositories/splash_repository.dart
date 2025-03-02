import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';

@lazySingleton
class SplashRepository extends BaseRepositoryImpl {
  SplashRepository(super._networkInfo);

  Future<Either<Failure, bool>> isUserAuthenticated() async {
    try {
      final String userToken = await SharedPreferencesHelper.getSecuredString(
          LocalStorageKeys.userToken);
      final bool isPhoneNumberVerified = SharedPreferencesHelper.getBool(
          LocalStorageKeys.isPhoneNumberVerified);
      if (!isPhoneNumberVerified) {
        SharedPreferencesHelper.clearAllSecuredData();
      }
      return Right(userToken.isNotEmpty && isPhoneNumberVerified);
    } catch (e) {
      return const Left(
        CacheFailure(errorMessage: "Can't get user token"),
      );
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ntp/ntp.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_functions.dart';
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

  Future<Either<Failure, bool>> tokenNeedRefresh() async {
    try {
      final String loggedInDate =
          SharedPreferencesHelper.getString(LocalStorageKeys.loggedInDate);
      if (loggedInDate.isEmpty) {
        return Right(false);
      }
      final DateTime nowDateTime =
          await NTP.now(lookUpAddress: 'time.windows.com');
      final Duration diff =
          nowDateTime.difference(DateTime.parse(loggedInDate));
      if (diff.inSeconds >= 3600) {
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      dPrint(
        "Error from tokenNeedRefresh: $e",
        stringColor: StringColor.red,
      );
      return const Left(
        CacheFailure(errorMessage: "Can't get user token"),
      );
    }
  }
}

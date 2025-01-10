import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ntp/ntp.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/dio_factory.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../data_sources/remote/sign_in_remote_data_source.dart';
import '../models/sign_in_model.dart';
import '../models/sign_in_request.dart';

@LazySingleton(as: SignInRepository)
class SignInRepositoryImpl extends BaseRepositoryImpl
    implements SignInRepository {
  final SignInRemoteDataSource _signInRemoteDataSource;

  SignInRepositoryImpl(this._signInRemoteDataSource);

  @override
  Future<Either<Failure, bool>> signIn(SignInRequest signInRequest) async {
    return await requestApi<bool, SignInModel>(
      <SignInModel>() async =>
          await _signInRemoteDataSource.signIn(signInRequest),
      (signInModel) async {
        DioFactory.setTokenIntoHeaderAfterLogin(signInModel.token);
        if (signInModel.isPhoneNumberVerified) {
          final DateTime loggedInTime =
              await NTP.now(lookUpAddress: 'time.windows.com');
          await SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.userToken,
            signInModel.token,
          );
          await SharedPreferencesHelper.setData(
            LocalStorageKeys.loggedInDate,
            loggedInTime.toString(),
          );
        }
        await SharedPreferencesHelper.setSecuredString(
          LocalStorageKeys.phoneNumber,
          signInRequest.phoneNumber,
        );
        await SharedPreferencesHelper.setSecuredString(
          LocalStorageKeys.password,
          signInRequest.password,
        );
        return signInModel.isPhoneNumberVerified;
      },
    );
  }
}

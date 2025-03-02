import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../data_sources/remote/sign_in_remote_data_source.dart';
import '../models/sign_in_model.dart';
import '../models/sign_in_request.dart';

@lazySingleton
class SignInRepository extends BaseRepositoryImpl {
  final SignInRemoteDataSource _signInRemoteDataSource;

  SignInRepository(this._signInRemoteDataSource, super._networkInfo);

  Future<Either<Failure, bool>> signIn(SignInRequest signInRequest) async {
    return await requestApi<bool, SignInModel>(
      <SignInModel>() async =>
          await _signInRemoteDataSource.signIn(signInRequest),
      (signInModel) {
        Future.wait([
          SharedPreferencesHelper.setData(
            LocalStorageKeys.isPhoneNumberVerified,
            signInModel.isPhoneNumberVerified,
          ),
          SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.userToken,
            signInModel.token,
          ),
          SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.phoneNumber,
            signInRequest.phoneNumber,
          ),
          SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.password,
            signInRequest.password,
          ),
        ]);

        return signInModel.isPhoneNumberVerified;
      },
    );
  }
}

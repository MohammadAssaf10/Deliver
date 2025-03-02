import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../data_sources/remote/sign_up_remote_data_source.dart';
import '../models/sign_up_model.dart';
import '../models/sign_up_request.dart';

@lazySingleton
class SignUpRepository extends BaseRepositoryImpl {
  final SignUpRemoteDataSource _signUpRemoteDataSource;

  SignUpRepository(this._signUpRemoteDataSource, super._networkInfo);

  Future<Either<Failure, void>> signUp(SignUpRequest signUpRequest) async =>
      await requestApi<void, SignUpModel>(
        <SignUpModel>() async =>
            await _signUpRemoteDataSource.signUp(signUpRequest),
        (signUpModel) async {
          await SharedPreferencesHelper.setData(
            LocalStorageKeys.isPhoneNumberVerified,
            false,
          );
          await SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.userToken,
            signUpModel.token,
          );
          await SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.phoneNumber,
            signUpRequest.phoneNumber,
          );
          await SharedPreferencesHelper.setSecuredString(
            LocalStorageKeys.password,
            signUpRequest.password,
          );
          return;
        },
      );
}

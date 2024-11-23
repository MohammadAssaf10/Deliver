import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/dio_factory.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../data_sources/remote/sign_up_remote_data_source.dart';
import '../models/sign_up_model.dart';

import '../models/sign_up_request.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl extends BaseRepositoryImpl
    implements SignUpRepository {
  final SignUpRemoteDataSource _signUpRemoteDataSource;

  SignUpRepositoryImpl(
    this._signUpRemoteDataSource,
  );

  @override
  Future<Either<Failure, void>> signUp(SignUpRequest signUpRequest) async =>
      await requestApi<void, SignUpModel>(
        <SignUpModel>() async =>
            await _signUpRemoteDataSource.signUp(signUpRequest),
        (signUpModel) async {
          DioFactory.setTokenIntoHeaderAfterLogin(signUpModel.token);
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

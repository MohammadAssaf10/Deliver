import 'package:dartz/dartz.dart';
import 'package:deliver/core/error/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../../sign_in/data/models/sign_in_request.dart';
import '../../../sign_in/domain/repositories/sign_in_repository.dart';
import '../../domain/repositories/verification_code_repository.dart';
import '../data_sources/remote/verification_code_remote_data_source.dart';

@LazySingleton(as: VerificationCodeRepository)
class VerificationCodeRepositoryImpl extends BaseRepositoryImpl
    implements VerificationCodeRepository {
  final VerificationCodeRemoteDataSource _verificationCodeRemoteDataSource;
  final SignInRepository _signInRepository;

  VerificationCodeRepositoryImpl(
    this._verificationCodeRemoteDataSource,
    this._signInRepository,
  );

  @override
  Future<Either<Failure, void>> generateVerificationCode() async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.generateVerificationCode(),
        (_) async {
          return;
        },
      );

  @override
  Future<Either<Failure, String>> getVerificationCode() async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.getVerificationCode(),
        (verificationCode) async {
          return verificationCode;
        },
      );

  @override
  Future<Either<Failure, void>> verifyPhoneNumber(String code) async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.verifyPhoneNumber(code),
        (_) async {
          final String phoneNumber =
              await SharedPreferencesHelper.getSecuredString(
                  LocalStorageKeys.phoneNumber);
          final String password =
              await SharedPreferencesHelper.getSecuredString(
                  LocalStorageKeys.password);
          final SignInRequest signInRequest = SignInRequest(
            phoneNumber: phoneNumber,
            password: password,
          );
          await _signInRepository.signIn(signInRequest);
          return;
        },
      );
}

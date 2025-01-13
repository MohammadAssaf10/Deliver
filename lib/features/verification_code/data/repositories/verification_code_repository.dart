import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../../sign_in/data/models/sign_in_request.dart';
import '../../../sign_in/data/repositories/sign_in_repository.dart';
import '../data_sources/remote/verification_code_remote_data_source.dart';

@lazySingleton
class VerificationCodeRepository extends BaseRepository {
  final VerificationCodeRemoteDataSource _verificationCodeRemoteDataSource;
  final SignInRepository _signInRepository;

  VerificationCodeRepository(
    this._verificationCodeRemoteDataSource,
    this._signInRepository,
  );

  Future<Either<Failure, void>> generateVerificationCode() async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.generateVerificationCode(),
        (_) async {
          return;
        },
      );

  Future<Either<Failure, String>> getVerificationCode() async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.getVerificationCode(),
        (verificationCode) async {
          return verificationCode;
        },
      );

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

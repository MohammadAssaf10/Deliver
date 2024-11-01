import 'package:dartz/dartz.dart';
import 'package:deliver/core/error/failure.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/repositories/verification_code_repository.dart';
import '../data_sources/remote/verification_code_remote_data_source.dart';

@LazySingleton(as: VerificationCodeRepository)
class VerificationCodeRepositoryImpl extends BaseRepositoryImpl
    implements VerificationCodeRepository {
  final VerificationCodeRemoteDataSource _verificationCodeRemoteDataSource;

  VerificationCodeRepositoryImpl(this._verificationCodeRemoteDataSource);

  @override
  Future<Either<Failure, void>> generateVerificationCode() async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.generateVerificationCode(),
        (_) {
          return;
        },
      );

  @override
  Future<Either<Failure, String>> getVerificationCode() async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.getVerificationCode(),
        (verificationCode) {
          return verificationCode;
        },
      );

  @override
  Future<Either<Failure, void>> verifyPhoneNumber(String code) async =>
      await requestApi(
        () async =>
            await _verificationCodeRemoteDataSource.verifyPhoneNumber(code),
        (_) {
          return;
        },
      );
}

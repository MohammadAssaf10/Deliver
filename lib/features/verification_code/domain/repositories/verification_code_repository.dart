import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/repositories/base_repository.dart';

abstract class VerificationCodeRepository extends BaseRepository {
  Future<Either<Failure, void>> generateVerificationCode();

  Future<Either<Failure, String>> getVerificationCode();

  Future<Either<Failure, void>> verifyPhoneNumber(String code);
}

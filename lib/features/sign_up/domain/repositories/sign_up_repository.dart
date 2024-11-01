import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../data/models/sign_up_request.dart';

abstract class SignUpRepository extends BaseRepository {
  Future<Either<Failure, void>> signUp(SignUpRequest signUpRequest);
}

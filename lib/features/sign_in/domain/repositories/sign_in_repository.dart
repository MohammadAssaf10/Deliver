import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../data/models/sign_in_request.dart';

abstract class SignInRepository extends BaseRepository {
  Future<Either<Failure, void>> signIn(SignInRequest signInRequest);
}

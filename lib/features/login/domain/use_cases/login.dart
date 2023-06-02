import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/failure.dart';
import '../../data/models/login_request.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<Failure, void>> call(LoginRequest loginRequest) async {
    return await loginRepository.login(loginRequest);
  }
}

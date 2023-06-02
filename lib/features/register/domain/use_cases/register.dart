import 'package:dartz/dartz.dart';
import 'package:deliver/features/register/data/models/register_request.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/failure.dart';
import '../repositories/register_repository.dart';

@lazySingleton
class RegisterUseCase {
  final RegisterRepository registerRepository;

  RegisterUseCase(this.registerRepository);

  Future<Either<Failure, void>> call(RegisterRequest registerRequest) async =>
      await registerRepository.register(registerRequest);
}

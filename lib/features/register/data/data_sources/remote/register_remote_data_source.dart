import 'package:deliver/features/register/data/models/register_request.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterRemoteDataSource {
  RegisterRemoteDataSource();

  Future<void> register(RegisterRequest registerRequest) async {}
}

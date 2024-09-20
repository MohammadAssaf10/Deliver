import 'package:deliver/features/login/data/models/login_request.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginRemoteDataSource {
  LoginRemoteDataSource();

  Future<void> login(LoginRequest loginRequest) async {}
}

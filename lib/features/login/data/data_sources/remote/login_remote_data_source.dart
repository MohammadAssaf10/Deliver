import '../../models/login_request.dart';

abstract class LoginRemoteDataSource{
  Future<void> login(LoginRequest loginRequest);
}
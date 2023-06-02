import '../../models/register_request.dart';

abstract class RegisterRemoteDataSource {
  Future<void> register(RegisterRequest registerRequest);
}

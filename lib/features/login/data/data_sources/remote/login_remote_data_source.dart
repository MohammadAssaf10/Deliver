import 'package:deliver/features/login/data/models/login_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  LoginRemoteDataSource(this._firebaseAuth);

  Future<void> login(LoginRequest loginRequest) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequest.phoneNumber,
      password: loginRequest.password,
    );
  }
}

import 'package:deliver/features/login/data/models/login_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'login_remote_data_source.dart';

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  LoginRemoteDataSourceImpl(this._firebaseAuth);

  @override
  Future<void> login(LoginRequest loginRequest) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequest.phoneNumber,
      password: loginRequest.password,
    );
  }
}

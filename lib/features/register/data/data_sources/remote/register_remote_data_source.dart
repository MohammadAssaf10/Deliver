import 'package:deliver/features/register/data/models/register_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  RegisterRemoteDataSource(this.firebaseAuth);

  Future<void> register(RegisterRequest registerRequest) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: registerRequest.email,
      password: registerRequest.password,
    );
  }
}

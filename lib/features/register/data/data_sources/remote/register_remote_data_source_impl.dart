import 'package:deliver/features/register/data/models/register_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  RegisterRemoteDataSourceImpl(this.firebaseAuth);

  @override
  Future<void> register(RegisterRequest registerRequest) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: registerRequest.email, password: registerRequest.password);
  }
}

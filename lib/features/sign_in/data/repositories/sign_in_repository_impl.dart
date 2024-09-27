import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../data_sources/remote/sign_in_remote_data_source.dart';
import '../models/sign_in_request.dart';
import '../models/user_model.dart';

@LazySingleton(as: SignInRepository)
class SignInRepositoryImpl extends BaseRepositoryImpl
    implements SignInRepository {
  final SignInRemoteDataSource remoteDataSource;

  SignInRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> signIn(SignInRequest signInRequest) async {
    return await requestApi<void, UserModel>(
      <UserModel>() async => await remoteDataSource.signIn(signInRequest),
      (_) {
        return;
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/remote/login_remote_data_source.dart';
import '../models/login_request.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, void>> login(LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.login(loginRequest));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}

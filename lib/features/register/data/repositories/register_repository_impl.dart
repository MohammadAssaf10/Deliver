import 'package:dartz/dartz.dart';
import 'package:deliver/core/network/network_info.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/register_repository.dart';
import '../data_sources/remote/register_remote_data_source.dart';
import '../models/register_request.dart';

@LazySingleton(as: RegisterRepository)
class RegisterRepositoryImpl extends RegisterRepository {
  final NetworkInfo networkInfo;
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl(
    this.networkInfo,
    this.remoteDataSource,
  );

  @override
  Future<Either<Failure, void>> register(
      RegisterRequest registerRequest) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.register(registerRequest));
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}

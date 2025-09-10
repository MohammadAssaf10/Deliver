import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../models/profile.dart';

@lazySingleton
class ProfileRepository extends BaseRepositoryImpl {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepository(this._profileRemoteDataSource, super._networkInfo);

  Future<Either<Failure, Profile>> getProfile() async => await requestApi(
    () async => await _profileRemoteDataSource.getProfile(),
    (profileModel) {
      return profileModel;
    },
  );

  Future<Either<Failure, String?>> logout() async => await requestApi(
    () async => await _profileRemoteDataSource.logout(),
    (message) {
      return message;
    },
  );
}

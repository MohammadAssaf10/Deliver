import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../data_sources/remote/main_remote_data_source.dart';

@lazySingleton
class MainRepository extends BaseRepositoryImpl {
  final MainRemoteDataSource _mainRemoteDataSource;

  MainRepository(this._mainRemoteDataSource, super._networkInfo);

  Future<Either<Failure, Trip?>> getCurrentTrip() async => await requestApi(
        () async => await _mainRemoteDataSource.getCurrentTrip(),
        (tripModel) {
          if (tripModel == null) return null;
          return tripModel.toDomain();
        },
      );
}

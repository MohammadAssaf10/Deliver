import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../../../core/entities/trip.dart';
import '../data_sources/remote/main_remote_data_source.dart';

@lazySingleton
class MainRepository extends BaseRepository {
  final MainRemoteDataSource _mainRemoteDataSource;

  MainRepository(this._mainRemoteDataSource);

  Future<Either<Failure, Trip?>> getCurrentTrip() async => await requestApi(
        () async => await _mainRemoteDataSource.getCurrentTrip(),
        (tripModel) async {
          if (tripModel == null) return null;
          return tripModel.toDomain();
        },
      );
}

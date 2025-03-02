import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../data_sources/remote/map_remote_data_source.dart';
import '../models/location_request.dart';
import '../models/trip_distance_and_duration.dart';

@lazySingleton
class MapRepository extends BaseRepositoryImpl {
  final MapRemoteDataSource _mapDataSource;

  MapRepository(this._mapDataSource, super._networkInfo);

  Future<Either<Failure, TripDistanceAndDuration>> calculateDistance({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
  }) async =>
      await requestApi(
        () async => await _mapDataSource.calculateDistance(
          startLocation: startLocation,
          endLocation: endLocation,
        ),
        (tripInfoModel) {
          return tripInfoModel;
        },
      );

  Future<Either<Failure, int>> createNewTrip({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
    required TripDistanceAndDuration tripInfo,
  }) async =>
      await requestApi(
        () async => await _mapDataSource.createNewTrip(
          startLocation: startLocation,
          endLocation: endLocation,
          tripInfo: tripInfo,
        ),
        (tripId) {
          return tripId;
        },
      );
}

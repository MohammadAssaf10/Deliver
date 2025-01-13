import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../models/location_request.dart';
import '../../../../core/repositories/base_repository.dart';
import '../data_sources/remote/map_remote_data_source.dart';
import '../models/trip_distance_and_duration.dart';

@lazySingleton
class MapRepository extends BaseRepository {
  final MapRemoteDataSource _mapDataSource;

  MapRepository(this._mapDataSource);

  Future<Either<Failure, TripDistanceAndDuration>> calculateDistance({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
  }) async =>
      await requestApi(
        () async => await _mapDataSource.calculateDistance(
          startLocation: startLocation,
          endLocation: endLocation,
        ),
        (tripInfoModel) async {
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
        (tripId) async {
          return tripId;
        },
      );
}

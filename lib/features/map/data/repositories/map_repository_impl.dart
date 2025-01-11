import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/entities/trip_distance_and_duration.dart';
import '../../domain/repositories/map_repository.dart';
import '../data_sources/remote/map_remote_data_source.dart';

@LazySingleton(as: MapRepository)
class MapRepositoryImpl extends BaseRepositoryImpl implements MapRepository {
  final MapRemoteDataSource _mapDataSource;

  MapRepositoryImpl(this._mapDataSource);

  @override
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
          return tripInfoModel.toDomain();
        },
      );

  @override
  Future<Either<Failure, void>> createNewTrip({
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
        (_) async {
          return;
        },
      );
}

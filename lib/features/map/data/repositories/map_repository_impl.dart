import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/entities/trip_info.dart';
import '../../domain/repositories/map_repository.dart';
import '../data_sources/remote/map_data_source.dart';
import '../../domain/entities/location_info.dart';

@LazySingleton(as: MapRepository)
class MapRepositoryImpl extends BaseRepositoryImpl implements MapRepository {
  final MapDataSource _mapDataSource;

  MapRepositoryImpl(this._mapDataSource);

  @override
  Future<Either<Failure, TripInfo>> calculateDistance({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
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
    required LocationInfo startLocation,
    required LocationInfo endLocation,
    required TripInfo tripInfo,
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

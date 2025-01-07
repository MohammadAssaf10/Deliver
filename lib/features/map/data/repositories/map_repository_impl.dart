import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/entities/distance.dart';
import '../../domain/repositories/map_repository.dart';
import '../data_sources/remote/map_data_source.dart';
import '../../domain/entities/location_info.dart';

@LazySingleton(as: MapRepository)
class MapRepositoryImpl extends BaseRepositoryImpl implements MapRepository {
  final MapDataSource _mapDataSource;

  MapRepositoryImpl(this._mapDataSource);

  @override
  Future<Either<Failure, Distance>> calculateDistance({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
  }) async =>
      await requestApi(
        () async => await _mapDataSource.calculateDistance(
          startLocation: startLocation,
          endLocation: endLocation,
        ),
        (distanceModel) async {
          return distanceModel.toDomain();
        },
      );
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/location_request.dart';
import '../../../../core/repositories/base_repository.dart';
import '../entities/trip_distance_and_duration.dart';

abstract class MapRepository extends BaseRepository {
  Future<Either<Failure, TripDistanceAndDuration>> calculateDistance({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
  });

  Future<Either<Failure, void>> createNewTrip({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
    required TripDistanceAndDuration tripInfo,
  });
}

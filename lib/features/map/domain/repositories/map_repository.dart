import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../entities/location_info.dart';
import '../entities/trip_info.dart';

abstract class MapRepository extends BaseRepository {
  Future<Either<Failure, TripInfo>> calculateDistance({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
  });

  Future<Either<Failure, void>> createNewTrip({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
    required TripInfo tripInfo,
  });
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../entities/location_info.dart';
import '../entities/distance.dart';

abstract class MapRepository extends BaseRepository {
  Future<Either<Failure, Distance>> calculateDistance({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
  });
}

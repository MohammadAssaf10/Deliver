import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../data/models/location_data_request.dart';
import '../entities/distance.dart';

abstract class MapRepository extends BaseRepository {
  Future<Either<Failure, Distance>> calculateDistance({
    required LocationDataRequest startLocation,
    required LocationDataRequest endLocation,
  });
}

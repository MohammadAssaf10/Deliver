import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../../../../core/entities/trip.dart';

abstract class MainRepository extends BaseRepository {
  Future<Either<Failure, Trip?>> getCurrentTrip();
}

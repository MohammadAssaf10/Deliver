import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository.dart';
import '../entities/trip_history.dart';

abstract class ActivitiesRepository extends BaseRepository{
  Future<Either<Failure,List<TripHistory>>> getTripHistories(int page);
}
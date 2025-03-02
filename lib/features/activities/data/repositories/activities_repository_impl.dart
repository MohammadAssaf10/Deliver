import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/entities/trip_history.dart';
import '../../domain/repositories/activities_repository.dart';
import '../data_sources/activities_remote_data_source.dart';

@LazySingleton(as: ActivitiesRepository)
class ActivitiesRepositoryImpl extends BaseRepositoryImpl
    implements ActivitiesRepository {
  final ActivitiesRemoteDataSource _activitiesRemoteDataSource;

  ActivitiesRepositoryImpl(
    this._activitiesRemoteDataSource,
    super._networkInfo,
  );

  @override
  Future<Either<Failure, List<TripHistory>>> getTripHistories(int page) async =>
      await requestApi(
        () async => await _activitiesRemoteDataSource.getTripHistories(page),
        (tripHistoriesModel) {
          return tripHistoriesModel.tripHistories
              .map((item) => item.toDomain())
              .toList();
        },
      );
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/entities/trip.dart';
import '../../domain/repositories/main_repository.dart';
import '../data_sources/remote/main_remote_data_source.dart';

@LazySingleton(as: MainRepository)
class MainRepositoryImpl extends BaseRepositoryImpl implements MainRepository {
  final MainRemoteDataSource _mainRemoteDataSource;

  MainRepositoryImpl(this._mainRemoteDataSource);

  @override
  Future<Either<Failure, Trip?>> getCurrentTrip() async => await requestApi(
        () async => await _mainRemoteDataSource.getCurrentTrip(),
        (tripModel) async {
          if (tripModel == null) return null;
          return tripModel.toDomain();
        },
      );
}

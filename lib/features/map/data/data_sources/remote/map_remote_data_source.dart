import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../../../../core/models/location_request.dart';
import '../../../domain/entities/trip_distance_and_duration.dart';
import '../../models/trip_distance_and_duration_model.dart';

abstract class MapRemoteDataSource extends BaseRemoteDataSource {
  Future<TripDistanceAndDurationModel> calculateDistance({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
  });

  Future<void> createNewTrip({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
    required TripDistanceAndDuration tripInfo,
  });
}

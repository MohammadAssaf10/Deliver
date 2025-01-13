import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../models/location_request.dart';
import '../../models/trip_distance_and_duration.dart';

abstract class MapRemoteDataSource extends BaseRemoteDataSource {
  Future<TripDistanceAndDuration> calculateDistance({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
  });

  Future<void> createNewTrip({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
    required TripDistanceAndDuration tripInfo,
  });
}

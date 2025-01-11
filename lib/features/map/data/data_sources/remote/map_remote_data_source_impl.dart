import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/models/location_request.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../domain/entities/trip_distance_and_duration.dart';
import '../../models/trip_distance_and_duration_model.dart';
import 'map_remote_data_source.dart';

@LazySingleton(as: MapRemoteDataSource)
class MapRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MapRemoteDataSource {
  @override
  Future<TripDistanceAndDurationModel> calculateDistance({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
  }) async {
    final result = await performGetRequest(
      endpoint: Endpoints.tripInfo,
      queryParameters: {
        "Origin.Lat": startLocation.latitude,
        "Origin.Lon": startLocation.longitude,
        "Destination.Lat": endLocation.latitude,
        "Destination.Lon": endLocation.longitude,
      },
    );
    return TripDistanceAndDurationModel.fromJson(result.data);
  }

  @override
  Future<void> createNewTrip({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
    required TripDistanceAndDuration tripInfo,
  }) async {
    await performPostRequest(
      endpoint: Endpoints.createNewTrip,
      body: {
        "pickUpAddress": {
          "longitude": startLocation.longitude,
          "latitude": startLocation.latitude,
        },
        "dropOfAddress": {
          "longitude": endLocation.longitude,
          "latitude": endLocation.latitude,
        },
        "distance": tripInfo.distance,
        "duration": tripInfo.duration,
      },
    );
  }
}

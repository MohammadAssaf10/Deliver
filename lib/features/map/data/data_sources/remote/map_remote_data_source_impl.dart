import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/models/base_model.dart';
import '../../models/location_request.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/trip_distance_and_duration.dart';
import 'map_remote_data_source.dart';

@LazySingleton(as: MapRemoteDataSource)
class MapRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MapRemoteDataSource {
  @override
  Future<TripDistanceAndDuration> calculateDistance({
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
    return TripDistanceAndDuration.fromJson(result.data);
  }

  @override
  Future<int> createNewTrip({
    required LocationRequest startLocation,
    required LocationRequest endLocation,
    required TripDistanceAndDuration tripInfo,
  }) async {
    final result = await performPostRequest(
      endpoint: Endpoints.trip,
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
    return result.data['id'];
  }

   @override
  Future<String?> deleteCurrentTrip() async {
    final BaseModel baseModel = await performDeleteRequest(
      endpoint: Endpoints.trip,
    );
    return baseModel.message;
  }
}

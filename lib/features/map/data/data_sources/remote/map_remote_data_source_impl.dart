import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../domain/entities/location_info.dart';
import '../../../domain/entities/trip_info.dart';
import '../../models/trip_info_model.dart';
import 'map_remote_data_source.dart';

@LazySingleton(as: MapRemoteDataSource)
class MapRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MapRemoteDataSource {
  @override
  Future<TripInfoModel> calculateDistance({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
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
    return TripInfoModel.fromJson(result.data);
  }

  @override
  Future<void> createNewTrip({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
    required TripInfo tripInfo,
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

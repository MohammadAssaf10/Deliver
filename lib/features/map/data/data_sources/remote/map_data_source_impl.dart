import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/network/endpoints.dart';
import '../../../domain/entities/location_info.dart';
import '../../models/distance_model.dart';
import 'map_data_source.dart';

@LazySingleton(as: MapDataSource)
class MapDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MapDataSource {
  @override
  Future<DistanceModel> calculateDistance({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
  }) async {
    final result = await performGetRequest(
      endpoint: Endpoints.distance,
      queryParameters: {
        "Origin.Lat": startLocation.latitude,
        "Origin.Lon": startLocation.longitude,
        "Destination.Lat": endLocation.latitude,
        "Destination.Lon": endLocation.longitude,
      },
    );
    return DistanceModel.fromJson(result.data);
  }
}

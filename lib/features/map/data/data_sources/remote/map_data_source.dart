import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../models/distance_model.dart';
import '../../models/location_data_request.dart';

abstract class MapDataSource extends BaseRemoteDataSource {
  Future<DistanceModel> calculateDistance({
    required LocationDataRequest startLocation,
    required LocationDataRequest endLocation,
  });
}

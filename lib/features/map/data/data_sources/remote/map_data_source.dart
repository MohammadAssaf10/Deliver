import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../models/distance_model.dart';
import '../../../domain/entities/location_info.dart';

abstract class MapDataSource extends BaseRemoteDataSource {
  Future<DistanceModel> calculateDistance({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
  });
}

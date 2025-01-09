import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../../domain/entities/trip_info.dart';
import '../../models/trip_info_model.dart';
import '../../../domain/entities/location_info.dart';

abstract class MapDataSource extends BaseRemoteDataSource {
  Future<TripInfoModel> calculateDistance({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
  });

  Future<void> createNewTrip({
    required LocationInfo startLocation,
    required LocationInfo endLocation,
    required TripInfo tripInfo,
  });
}

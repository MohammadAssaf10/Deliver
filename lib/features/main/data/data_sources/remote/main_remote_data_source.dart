import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../models/trip_model.dart';

abstract class MainRemoteDataSource extends BaseRemoteDataSource {
  Future<TripModel?> getCurrentTrip();
  Future<void> refreshFCMToken(String fcmToken, String deviceId);
}

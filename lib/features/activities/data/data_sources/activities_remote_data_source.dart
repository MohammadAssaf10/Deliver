import '../../../../core/data_source/remote/base_remote_data_source.dart';
import '../model/trip_histories_model.dart';

abstract class ActivitiesRemoteDataSource extends BaseRemoteDataSource {
  Future<TripHistoriesModel> getTripHistories(int page);
}

import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/trip_model.dart';
import 'main_remote_data_source.dart';

@LazySingleton(as: MainRemoteDataSource)
class MainRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements MainRemoteDataSource {
  @override
  Future<TripModel?> getCurrentTrip() async {
    final result = await performGetRequest(endpoint: Endpoints.currentTrip);
    if (result.data == null) return null;
    return TripModel.fromJson(result.data);
  }
}

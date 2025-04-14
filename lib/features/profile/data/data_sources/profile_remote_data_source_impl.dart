import 'package:injectable/injectable.dart';

import '../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../core/models/base_model.dart';
import '../../../../core/network/endpoints.dart';
import '../models/profile_model.dart';
import 'profile_remote_data_source.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements ProfileRemoteDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    final BaseModel baseModel = await performGetRequest(
      endpoint: Endpoints.profile,
    );
    return ProfileModel.fromJson(baseModel.data);
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../core/models/base_model.dart';
import '../../../../core/network/endpoints.dart';
import 'profile_details_remote_data_source.dart';

@LazySingleton(as: ProfileDetailsRemoteDataSource)
class ProfileDetailsRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements ProfileDetailsRemoteDataSource {
  @override
  Future<String?> updateProfileDetails({
    required String profileImage,
    required String username,
    required String mobileNumber,
  }) async {
    final BaseModel baseModel = await performPutRequest(
      endpoint: Endpoints.profile,
      body: {
        "name": username,
        "phone": mobileNumber,
        "profileImage": profileImage,
      },
    );
    return baseModel.message;
  }
}

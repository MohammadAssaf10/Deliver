import '../../../../core/data_source/remote/base_remote_data_source.dart';

abstract class ProfileDetailsRemoteDataSource extends BaseRemoteDataSource {
  Future<String?> updateProfileDetails({
    required String profileImage,
    required String username,
    required String mobileNumber,
  });
}

import '../../../../core/data_source/remote/base_remote_data_source.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource extends BaseRemoteDataSource{
  Future<ProfileModel> getProfile();
}
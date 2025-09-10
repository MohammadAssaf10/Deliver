import '../../../../core/data_source/remote/base_remote_data_source.dart';
import '../models/profile.dart';

abstract class ProfileRemoteDataSource extends BaseRemoteDataSource{
  Future<Profile> getProfile();
  Future<String?> logout();
}
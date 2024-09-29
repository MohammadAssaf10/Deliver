import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../../../../core/models/user_model.dart';
import '../../models/sign_up_request.dart';

abstract class SignUpRemoteDataSource extends BaseRemoteDataSource {
  Future<UserModel> signUp(SignUpRequest signUpRequest);
}

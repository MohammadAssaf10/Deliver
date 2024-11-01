import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../models/sign_up_model.dart';
import '../../models/sign_up_request.dart';

abstract class SignUpRemoteDataSource extends BaseRemoteDataSource {
  Future<SignUpModel> signUp(SignUpRequest signUpRequest);
}

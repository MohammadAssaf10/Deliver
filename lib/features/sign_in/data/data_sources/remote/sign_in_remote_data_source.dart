import '../../../../../core/data_source/remote/base_remote_data_source.dart';
import '../../models/sign_in_request.dart';
import '../../models/sign_in_model.dart';

abstract class SignInRemoteDataSource extends BaseRemoteDataSource {
  Future<SignInModel> signIn(SignInRequest signInRequest);
}

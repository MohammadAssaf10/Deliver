import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/models/base_model.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/sign_in_request.dart';
import '../../../../../core/models/user_model.dart';
import 'sign_in_remote_data_source.dart';

@LazySingleton(as: SignInRemoteDataSource)
class SignInRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements SignInRemoteDataSource {
  @override
  Future<UserModel> signIn(SignInRequest signInRequest) async {
    final BaseModel baseModel = await performPostRequest(
      endpoint: Endpoints.signIn,
      body: {
        "userName": signInRequest.phoneNumber,
        "password": signInRequest.password,
      },
    );
    return UserModel.fromJson(baseModel.data);
  }
}

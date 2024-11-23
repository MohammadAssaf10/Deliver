import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/models/base_model.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/sign_up_model.dart';
import '../../models/sign_up_request.dart';
import 'sign_up_remote_data_source.dart';

@LazySingleton(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements SignUpRemoteDataSource {
  @override
  Future<SignUpModel> signUp(SignUpRequest signUpRequest) async {
    final BaseModel baseModel = await performPostRequest(
      endpoint: Endpoints.signUp,
      body: {
        "name": signUpRequest.username,
        "phone": signUpRequest.phoneNumber,
        "password": signUpRequest.password,
      },
    );
    return SignUpModel.fromJson(baseModel.data);
  }
}

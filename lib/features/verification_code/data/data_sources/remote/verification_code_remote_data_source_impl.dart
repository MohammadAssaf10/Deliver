import 'package:injectable/injectable.dart';

import '../../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '../../../../../core/network/endpoints.dart';
import 'verification_code_remote_data_source.dart';

@LazySingleton(as: VerificationCodeRemoteDataSource)
class VerificationCodeRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements VerificationCodeRemoteDataSource {
  @override
  Future<void> generateVerificationCode() async {
    await performPostRequest(
      endpoint: Endpoints.generateVerificationCode,
    );
  }

  @override
  Future<String> getVerificationCode() async {
    final result = await performGetRequest(
      endpoint: Endpoints.getVerificationCode,
    );
    return result.data;
  }

  @override
  Future<void> verifyPhoneNumber(String code) async {
    await performPutRequest(
      endpoint: Endpoints.verifyPhoneNumber,
      body: {
        "code": code,
      },
    );
  }
}

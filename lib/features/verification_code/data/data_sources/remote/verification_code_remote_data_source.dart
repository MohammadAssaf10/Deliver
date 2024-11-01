import '../../../../../core/data_source/remote/base_remote_data_source.dart';

abstract class VerificationCodeRemoteDataSource extends BaseRemoteDataSource {
  Future<void> generateVerificationCode();

  Future<String> getVerificationCode();

  Future<void> verifyPhoneNumber(String code);
}

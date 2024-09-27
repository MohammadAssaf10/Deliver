import '../../models/base_model.dart';

abstract class BaseRemoteDataSource {
  Future<BaseModel> performGetRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });

  Future<BaseModel> performPostRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });
}

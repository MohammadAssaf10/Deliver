import 'package:flutter/material.dart';

import '../../models/base_model.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<BaseModel> performGetRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });

  @protected
  Future<BaseModel> performPostRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });

  @protected
  Future<BaseModel> performPutRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });
  @protected
  Future<BaseModel> performDeleteRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  });
}

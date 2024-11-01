import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../error/exceptions.dart';
import '../../models/base_model.dart';
import '../../network/dio_factory.dart';
import 'base_remote_data_source.dart';

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  @protected
  final Dio _dio = DioFactory.getDio();

  @override
  Future<BaseModel> performGetRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final Response<Map<String, dynamic>> response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
    if (response.data != null) {
      final BaseModel baseModel = BaseModel.fromJson(response.data!);
      if (response.statusCode == 200 && baseModel.statusCode == 200) {
        return baseModel;
      } else {
        throw ServerException(error: baseModel.message);
      }
    } else {
      throw const ServerException(error: "Something went wrong");
    }
  }

  @override
  Future<BaseModel> performPostRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response<Map<String, dynamic>> response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParameters,
    );
    if (response.data != null) {
      final BaseModel baseModel = BaseModel.fromJson(response.data!);
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          (baseModel.statusCode == 200 || baseModel.statusCode == 201)) {
        return baseModel;
      } else {
        throw ServerException(error: baseModel.message);
      }
    } else {
      throw const ServerException(error: "Something went wrong");
    }
  }

  @override
  Future<BaseModel> performPutRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response<Map<String, dynamic>> response = await _dio.put(
      endpoint,
      data: body,
      queryParameters: queryParameters,
    );
    if (response.data != null) {
      final BaseModel baseModel = BaseModel.fromJson(response.data!);
      if ((response.statusCode == 200 || response.statusCode == 204) &&
          (baseModel.statusCode == 200 || baseModel.statusCode == 204)) {
        return baseModel;
      } else {
        throw ServerException(error: baseModel.message);
      }
    } else {
      throw const ServerException(error: "Something went wrong");
    }
  }
}

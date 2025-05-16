import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../generated/l10n.dart';
import '../../error/error_handler.dart';
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
    try {
      final Response<Map<String, dynamic>> response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      if (response.data != null) {
        final BaseModel baseModel = BaseModel.fromJson(response.data!);
        if (response.statusCode == 200 || baseModel.statusCode == 200) {
          return baseModel;
        } else {
          throw ServerException(error: baseModel.message);
        }
      } else {
        throw ServerException(error: S.current.somethingWentWrong);
      }
    } catch (e) {
      throw ErrorHandler.handleExceptionError(e);
    }
  }

  @override
  Future<BaseModel> performPostRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
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
        throw ServerException(error: S.current.somethingWentWrong);
      }
    } catch (e) {
      throw ErrorHandler.handleExceptionError(e);
    }
  }

  @override
  Future<BaseModel> performPutRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.put(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      if (response.data != null) {
        final BaseModel baseModel = BaseModel.fromJson(response.data!);
        if ((response.statusCode == 200 || response.statusCode == 202) &&
            (baseModel.statusCode == 200 || baseModel.statusCode == 202)) {
          return baseModel;
        } else {
          throw ServerException(error: baseModel.message);
        }
      } else {
        throw ServerException(error: S.current.somethingWentWrong);
      }
    } catch (e) {
      throw ErrorHandler.handleExceptionError(e);
    }
  }

  @override
  Future<BaseModel> performDeleteRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response<Map<String, dynamic>> response = await _dio.delete(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      if (response.data != null) {
        final BaseModel baseModel = BaseModel.fromJson(response.data!);
        if ((response.statusCode == 200 || response.statusCode == 202) &&
            (baseModel.statusCode == 200 || baseModel.statusCode == 202)) {
          return baseModel;
        } else {
          throw ServerException(error: baseModel.message);
        }
      } else {
        throw ServerException(error: S.current.somethingWentWrong);
      }
    } catch (e) {
      throw ErrorHandler.handleExceptionError(e);
    }
  }
}

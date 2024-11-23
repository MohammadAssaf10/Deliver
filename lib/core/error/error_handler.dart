import 'package:dio/dio.dart';

import '../models/base_model.dart';
import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  ErrorHandler._();

  static Failure handleFailureError(dynamic error) {
    if (error is ServerException) {
      return ServerFailure(errorMessage: error.exceptionMessage);
    } else if (error is CacheException) {
      return CacheFailure(errorMessage: error.exceptionMessage);
    } else {
      return const GeneralFailure();
    }
  }

  static GenericExceptions handleExceptionError(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        final BaseModel baseModel = BaseModel.fromJson(error.response!.data);
        return ServerException(error: baseModel.message);
      } else {
        return const GeneralException();
      }
    } else if (error is ServerException) {
      return ServerException(error: error.exceptionMessage);
    } else if (error is CacheException) {
      return CacheException(error: error.exceptionMessage);
    } else {
      return const GeneralException();
    }
  }
}

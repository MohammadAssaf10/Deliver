import 'package:dio/dio.dart';

import '../models/base_model.dart';
import 'exceptions.dart';
import 'failure.dart';

class ErrorHandler {
  ErrorHandler._();

  static Failure handleError(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        final BaseModel baseModel = BaseModel.fromJson(error.response!.data);
        return ServerFailure(errorMessage: baseModel.message);
      } else {
        return const GeneralFailure();
      }
    } else if (error is ServerException) {
      return ServerFailure(errorMessage: error.exceptionMessage);
    } else if (error is CacheException) {
      return CacheFailure(errorMessage: error.exceptionMessage);
    } else {
      return const GeneralFailure();
    }
  }
}

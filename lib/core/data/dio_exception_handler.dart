import 'package:dio/dio.dart';

import '../../generated/l10n.dart';
import 'exception_handler.dart';
import 'failure.dart';

Failure getDioFailure(DioError exception) {
  switch (exception.type) {
    case DioErrorType.connectionTimeout:
      return Failure(
        exception.response?.statusCode ?? ResponseCode.timeout,
        exception.response?.statusMessage ?? S.current.errorHappened,
      );

    case DioErrorType.sendTimeout:
      return Failure(
        exception.response?.statusCode ?? ResponseCode.timeout,
        exception.response?.statusMessage ?? S.current.errorHappened,
      );

    case DioErrorType.receiveTimeout:
      return Failure(
        exception.response?.statusCode ?? ResponseCode.timeout,
        exception.response?.statusMessage ?? S.current.errorHappened,
      );

    case DioErrorType.connectionError:
      return Failure(
        exception.response?.statusCode ?? ResponseCode.errorHappened,
        exception.response?.statusMessage ?? S.current.errorHappened,
      );

    case DioErrorType.badResponse:
      return Failure(
        exception.response?.statusCode ?? ResponseCode.errorHappened,
        exception.response?.statusMessage ?? S.current.errorHappened,
      );

    case DioErrorType.cancel:
      return Failure(
        exception.response?.statusCode ?? ResponseCode.cancel,
        exception.response?.statusMessage ?? S.current.errorHappened,
      );

    case DioErrorType.unknown:
      return Failure(
        exception.response?.statusCode ?? ResponseCode.errorHappened,
        exception.response?.statusMessage ?? S.current.errorHappened,
      );

    case DioErrorType.badCertificate:
      return Failure(
        exception.response?.statusCode ?? ResponseCode.errorHappened,
        exception.response?.statusMessage ?? S.current.errorHappened,
      );
  }
}

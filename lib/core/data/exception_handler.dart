import 'package:dio/dio.dart';

import 'dio_exception_handler.dart';
import 'failure.dart';
import '../../generated/l10n.dart';

Failure handleException(exception) {
  if (exception is DioError) {
    return getDioFailure(exception);
  } else {
    print(
        "unhandled exception: ${exception.runtimeType} ${exception.toString()}");
    Failure failure = Failure(0, S.current.errorHappened);
    return failure;
  }
}

enum DataSourceExceptions { noInternetConnections, forbidden }

extension DataSourceExceptionsExtensions on DataSourceExceptions {
  Failure getFailure() {
    switch (this) {
      case DataSourceExceptions.noInternetConnections:
        return Failure(
            ResponseCode.noInternetConnection, S.current.networkError);
      case DataSourceExceptions.forbidden:
        return Failure(ResponseCode.forbidden, S.current.forbiddenError);
    }
  }
}

class ResponseCode {
  static const int forbidden = 403; // failure, API rejected request

  // local status code
  static const int cancel = -1;
  static const int timeout = -2;
  static const int noInternetConnection = -3;
  static const int errorHappened = -4;
}

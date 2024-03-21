import 'package:dio/dio.dart';
import 'failure.dart';
import '../../generated/l10n.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // Dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else if (error is InternetConnectionFailure) {
      failure = Failure(code: 404, message: S.current.networkError);
    } else {
      // Default error
      failure = Failure(code: 404, message: S.current.somethingWentWrong);
    }
  }
}

class InternetConnectionFailure implements Exception {}

Failure _handleError(DioException exception) {
  if (exception.response != null && exception.response!.statusCode != null) {
    if (exception.response!.statusCode == 400) {
      return Failure(
        code: 400,
        message: S.current.error400,
      );
    } else if (exception.response!.statusCode == 401) {
      return Failure(
        code: 401,
        message: S.current.error401,
      );
    } else if (exception.response!.statusCode == 403) {
      return Failure(
        code: 403,
        message: S.current.error403,
      );
    } else if (exception.response!.statusCode == 404) {
      return Failure(
        code: 404,
        message: S.current.error404,
      );
    } else if (exception.response!.statusCode == 500) {
      return Failure(
        code: 500,
        message: S.current.error500,
      );
    } else if (exception.response!.statusCode == 503) {
      return Failure(
        code: 503,
        message: S.current.error503,
      );
    } else {
      return Failure(
        code: 404,
        message: S.current.somethingWentWrong,
      );
    }
  } else {
    return Failure(
      code: 404,
      message: S.current.somethingWentWrong,
    );
  }
}

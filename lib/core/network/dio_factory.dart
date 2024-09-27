import 'package:dio/dio.dart';

import '../utils/app_enums.dart';
import '../utils/constant.dart';
import '../utils/shared_preferences_helper.dart';
import 'endpoints.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = Endpoints.baseUrl;
      _addDioHeaders();
      _addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'text/plain',
      'Content-Type': 'application/json',
      'Accept-Language':
          SharedPreferencesHelper.getString(LocalStorageKeys.appLanguage),
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void setNewLanguageAfterChanged(Language language) {
    dio?.options.headers['Accept-Language'] = language.name;
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}

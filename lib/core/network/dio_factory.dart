import 'package:dio/dio.dart';

import '../utils/app_enums.dart';
import '../utils/constant.dart';
import '../utils/shared_preferences_helper.dart';
import 'endpoints.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.baseUrl = Endpoints.baseUrl;
      _addDioHeaders();
      _addDioInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void _addDioHeaders() async {
    _dio?.options.headers = {
      'Accept': 'text/plain',
      'Content-Type': 'application/json',
      'Authorization':
          "Bearer ${await SharedPreferencesHelper.getSecuredString(LocalStorageKeys.userToken)}",
      'Accept-Language':
          SharedPreferencesHelper.getString(LocalStorageKeys.appLanguage),
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void setNewLanguageAfterChanged(Language language) {
    _dio?.options.headers['Accept-Language'] = language.name;
  }

  static void _addDioInterceptor() {
    _dio?.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}

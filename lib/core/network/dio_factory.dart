import 'package:dio/dio.dart';

import '../../features/sign_in/data/models/sign_in_request.dart';
import '../../features/sign_in/data/repositories/sign_in_repository.dart';
import '../di/di.dart';
import '../utils/app_enums.dart';
import '../utils/app_extensions.dart';
import '../utils/app_functions.dart';
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
      _addDioInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void _addDioInterceptor() {
    _dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final DateTime currentDateTime = DateTime.now();
          final String timeZoneName = currentDateTime.timeZoneName;
          final Duration timeZoneOffset = currentDateTime.timeZoneOffset;
          final String userToken =
              await SharedPreferencesHelper.getSecuredString(
                  LocalStorageKeys.userToken);
          final String language =
              SharedPreferencesHelper.getString(LocalStorageKeys.appLanguage);
          if (!userToken.nullOrEmpty()) {
            options.headers['Authorization'] =
                'Bearer ${await SharedPreferencesHelper.getSecuredString(LocalStorageKeys.userToken)}';
          }
          if (!language.nullOrEmpty()) {
            options.headers['Accept-Language'] = language;
          }
          options.headers['Accept'] = 'text/plain';
          options.headers['content-type'] = 'application/json';
          options.headers['timeZoneName'] = timeZoneName;
          options.headers['timeZoneOffset'] = timeZoneOffset;
          dPrint('*** Request ***', stringColor: StringColor.magenta);
          dPrint("uri: ${options.uri}");
          dPrint("method: ${options.method}");
          dPrint("headers: ${options.headers}");
          if (options.data != null) {
            dPrint("body: ${options.data}");
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          dPrint('*** Response ***', stringColor: StringColor.magenta);
          dPrint("statusCode: ${response.statusCode}");
          dPrint("statusMessage: ${response.statusMessage}");
          dPrint("response: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException dioException, handler) async {
          if (dioException.response != null) {
            dPrint("*** Error Response ***", stringColor: StringColor.magenta);
            dPrint("statusCode: ${dioException.response!.statusCode}");
            dPrint("statusMessage: ${dioException.response!.statusMessage}");
            dPrint("response: ${dioException.response!.data}");
          }

          if (dioException.response?.statusCode == 401) {
            dPrint('Token is Expired', stringColor: StringColor.yellow);
            try {
              final String phoneNumber =
                  await SharedPreferencesHelper.getSecuredString(
                      LocalStorageKeys.phoneNumber);
              final String password =
                  await SharedPreferencesHelper.getSecuredString(
                      LocalStorageKeys.password);
              final SignInRepository signInRepository =
                  getIt<SignInRepository>();
              final SignInRequest signInRequest =
                  SignInRequest(phoneNumber: phoneNumber, password: password);
              await signInRepository.signIn(signInRequest);
              final retryResponse =
                  await _dio?.fetch(dioException.requestOptions);
              return handler.resolve(retryResponse!);
            } catch (e) {
              // TODO: Handle force user logout and return it to sign in page
              return handler.next(dioException);
            }
          }
          return handler.next(dioException);
        },
      ),
    );
  }
}

import 'dart:async';

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
    Completer<void>? tokenRefreshCompleter;
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
            options.headers['Authorization'] = 'Bearer $userToken';
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
          dPrint('*** Success Response ***', stringColor: StringColor.green);
          dPrint("uri: ${response.realUri}");
          dPrint("statusCode: ${response.statusCode}");
          dPrint("statusMessage: ${response.statusMessage}");
          dPrint("response: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException dioException, handler) async {
          if (dioException.response != null) {
            dPrint("*** Error Response ***", stringColor: StringColor.red);
            dPrint("uri: ${dioException.requestOptions.uri}");
            dPrint("statusCode: ${dioException.response!.statusCode}");
            dPrint("statusMessage: ${dioException.response!.statusMessage}");
            dPrint("response: ${dioException.response!.data}");
          }
          final String userToken =
          await SharedPreferencesHelper.getSecuredString(
              LocalStorageKeys.userToken);
          if ((dioException.response?.statusCode == 401 ||
              dioException.response?.data['statusCode'] == 401) &&
              !userToken.nullOrEmpty()) {
            dPrint('Token is Expired', stringColor: StringColor.yellow);
            try {
              if (tokenRefreshCompleter != null) {
                // Wait for refresh token complete
                await tokenRefreshCompleter!.future;
              } else {
                tokenRefreshCompleter = Completer<void>();
                await SharedPreferencesHelper.removeSecureData(
                  LocalStorageKeys.userToken,
                );
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
                tokenRefreshCompleter!.complete();
              }
              // Retry the failed request with the new token
              final clonedRequest = dioException.requestOptions.copyWith();
              final retryResponse = await _dio?.fetch(clonedRequest);
              return handler.resolve(retryResponse!);
            } catch (e) {
              tokenRefreshCompleter?.completeError(e);
              // TODO: Handle force user logout and return it to sign in page
              return handler.next(dioException);
            } finally {
              tokenRefreshCompleter = null;
            }
          }
          return handler.next(dioException);
        },
      ),
    );
  }
}

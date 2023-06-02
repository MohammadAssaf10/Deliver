import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}

Dio getDio() {
  const String applicationJson = "application/json";
  const String contentType = "content-type";
  const String accept = "accept";
  const String authorization = "Authorization";
  const int apiTimeOut = 5;
  Dio dio = Dio();

  Map<String, String> headers = {
    contentType: applicationJson,
    accept: applicationJson,
  };

  dio.options = BaseOptions(
    headers: headers,
    receiveTimeout: const Duration(seconds: apiTimeOut),
    sendTimeout: const Duration(seconds: apiTimeOut),
  );

  if (!kReleaseMode) {
    // its debug mode so print app logs
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  return dio;
}

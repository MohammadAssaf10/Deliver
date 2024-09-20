import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

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
  Future<SharedPreferences> getSharedPreferences() =>
      SharedPreferences.getInstance();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  Location get location => Location();
}

Dio getDio() {
  Dio dio = Dio();

  dio.options = BaseOptions(
    headers: {
      "content-type": "application/json",
      "accept": "application/json",
      // "Authorization":''
    },
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  );

  if (kDebugMode) {
    // its debug mode so print app logs
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  return dio;
}

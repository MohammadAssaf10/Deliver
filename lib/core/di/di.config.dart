// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../features/login/presentation/bloc/login_bloc.dart' as _i6;
import '../../features/register/presentation/bloc/register_bloc.dart' as _i8;
import '../language/cubit/language_cubit.dart' as _i5;
import '../network/network_info.dart' as _i7;
import 'di.dart' as _i10;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Connectivity>(() => registerModule.connectivity);
  gh.lazySingleton<_i4.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i5.LanguageCubit>(() => _i5.LanguageCubit());
  gh.lazySingleton<_i6.LoginBloc>(() => _i6.LoginBloc());
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i7.NetworkInfoImpl(gh<_i3.Connectivity>()));
  gh.lazySingleton<_i8.RegisterBloc>(() => _i8.RegisterBloc());
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  return getIt;
}

class _$RegisterModule extends _i10.RegisterModule {}

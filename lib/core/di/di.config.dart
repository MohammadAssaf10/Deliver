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
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../../features/login/data/data_sources/remote/login_remote_data_source.dart'
    as _i6;
import '../../features/login/data/data_sources/remote/login_remote_data_source_impl.dart'
    as _i7;
import '../../features/login/data/repositories/login_repository_impl.dart'
    as _i16;
import '../../features/login/domain/repositories/login_repository.dart' as _i15;
import '../../features/login/domain/use_cases/login.dart' as _i17;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i19;
import '../../features/register/data/data_sources/remote/register_remote_data_source.dart'
    as _i9;
import '../../features/register/data/data_sources/remote/register_remote_data_source_impl.dart'
    as _i10;
import '../../features/register/data/repositories/register_repository_impl.dart'
    as _i12;
import '../../features/register/domain/repositories/register_repository.dart'
    as _i11;
import '../../features/register/domain/use_cases/register.dart' as _i13;
import '../../features/register/presentation/bloc/register_bloc.dart' as _i18;
import '../language/cubit/language_cubit.dart' as _i5;
import '../network/network_info.dart' as _i8;
import 'di.dart' as _i20;

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
  gh.lazySingleton<_i6.LoginRemoteDataSource>(
      () => _i7.LoginRemoteDataSourceImpl(gh<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i8.NetworkInfo>(
      () => _i8.NetworkInfoImpl(gh<_i3.Connectivity>()));
  gh.lazySingleton<_i9.RegisterRemoteDataSource>(
      () => _i10.RegisterRemoteDataSourceImpl(gh<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i11.RegisterRepository>(() => _i12.RegisterRepositoryImpl(
        gh<_i8.NetworkInfo>(),
        gh<_i9.RegisterRemoteDataSource>(),
      ));
  gh.lazySingleton<_i13.RegisterUseCase>(
      () => _i13.RegisterUseCase(gh<_i11.RegisterRepository>()));
  await gh.factoryAsync<_i14.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i15.LoginRepository>(() => _i16.LoginRepositoryImpl(
        gh<_i8.NetworkInfo>(),
        gh<_i6.LoginRemoteDataSource>(),
      ));
  gh.lazySingleton<_i17.LoginUseCase>(
      () => _i17.LoginUseCase(gh<_i15.LoginRepository>()));
  gh.lazySingleton<_i18.RegisterBloc>(
      () => _i18.RegisterBloc(gh<_i13.RegisterUseCase>()));
  gh.lazySingleton<_i19.LoginBloc>(
      () => _i19.LoginBloc(gh<_i17.LoginUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i20.RegisterModule {}

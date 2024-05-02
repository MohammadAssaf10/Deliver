// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../app/data/data_sources/local/app_local_data_source.dart' as _i11;
import '../../app/data/data_sources/local/app_local_data_source_impl.dart'
    as _i12;
import '../../app/data/repositories/app_repository_impl.dart' as _i14;
import '../../app/domain/repositories/app_repository.dart' as _i13;
import '../../app/presentation/bloc/app_cubit.dart' as _i18;
import '../../features/login/data/data_sources/remote/login_remote_data_source.dart'
    as _i5;
import '../../features/login/data/repositories/login_repository_impl.dart'
    as _i16;
import '../../features/login/domain/repositories/login_repository.dart' as _i15;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i19;
import '../../features/register/data/data_sources/remote/register_remote_data_source.dart'
    as _i7;
import '../../features/register/data/repositories/register_repository_impl.dart'
    as _i9;
import '../../features/register/domain/repositories/register_repository.dart'
    as _i8;
import '../../features/register/presentation/bloc/register_bloc.dart' as _i17;
import '../network/network_info.dart' as _i6;
import 'di.dart' as _i20;

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
  gh.lazySingleton<_i5.LoginRemoteDataSource>(
      () => _i5.LoginRemoteDataSource(gh<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(gh<_i3.Connectivity>()));
  gh.lazySingleton<_i7.RegisterRemoteDataSource>(
      () => _i7.RegisterRemoteDataSource(gh<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i8.RegisterRepository>(() => _i9.RegisterRepositoryImpl(
        gh<_i6.NetworkInfo>(),
        gh<_i7.RegisterRemoteDataSource>(),
      ));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i11.AppLocalDataSource>(
      () => _i12.AppLocalDataSourceImpl(gh<_i10.SharedPreferences>()));
  gh.lazySingleton<_i13.AppRepository>(
      () => _i14.AppRepositoryImpl(gh<_i11.AppLocalDataSource>()));
  gh.lazySingleton<_i15.LoginRepository>(() => _i16.LoginRepositoryImpl(
        gh<_i6.NetworkInfo>(),
        gh<_i5.LoginRemoteDataSource>(),
      ));
  gh.factory<_i17.RegisterBloc>(
      () => _i17.RegisterBloc(gh<_i8.RegisterRepository>()));
  gh.lazySingleton<_i18.AppCubit>(
      () => _i18.AppCubit(gh<_i13.AppRepository>()));
  gh.factory<_i19.LoginBloc>(() => _i19.LoginBloc(gh<_i15.LoginRepository>()));
  return getIt;
}

class _$RegisterModule extends _i20.RegisterModule {}

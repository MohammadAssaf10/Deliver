// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../app/data/data_sources/local/app_local_data_source.dart' as _i13;
import '../../app/data/data_sources/local/app_local_data_source_impl.dart'
    as _i14;
import '../../app/data/repositories/app_repository_impl.dart' as _i19;
import '../../app/domain/repositories/app_repository.dart' as _i18;
import '../../app/presentation/bloc/app_cubit.dart' as _i21;
import '../../features/login/data/data_sources/remote/login_remote_data_source.dart'
    as _i8;
import '../../features/login/data/repositories/login_repository_impl.dart'
    as _i16;
import '../../features/login/domain/repositories/login_repository.dart' as _i15;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i20;
import '../../features/maps/presentation/bloc/map_bloc.dart' as _i12;
import '../../features/register/data/data_sources/remote/register_remote_data_source.dart'
    as _i7;
import '../../features/register/data/repositories/register_repository_impl.dart'
    as _i11;
import '../../features/register/domain/repositories/register_repository.dart'
    as _i10;
import '../../features/register/presentation/bloc/register_bloc.dart' as _i17;
import '../network/network_info.dart' as _i9;
import 'di.dart' as _i22;

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
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => registerModule.getSharedPreferences(),
    preResolve: true,
  );
  gh.lazySingleton<_i4.Connectivity>(() => registerModule.connectivity);
  gh.lazySingleton<_i5.FirebaseAuth>(() => registerModule.firebaseAuth);
  gh.lazySingleton<_i6.Location>(() => registerModule.location);
  gh.lazySingleton<_i7.RegisterRemoteDataSource>(
      () => _i7.RegisterRemoteDataSource(gh<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i8.LoginRemoteDataSource>(
      () => _i8.LoginRemoteDataSource(gh<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i9.NetworkInfo>(
      () => _i9.NetworkInfoImpl(gh<_i4.Connectivity>()));
  gh.lazySingleton<_i10.RegisterRepository>(() => _i11.RegisterRepositoryImpl(
        gh<_i9.NetworkInfo>(),
        gh<_i7.RegisterRemoteDataSource>(),
      ));
  gh.factory<_i12.MapBloc>(() => _i12.MapBloc(gh<_i6.Location>()));
  gh.lazySingleton<_i13.AppLocalDataSource>(
      () => _i14.AppLocalDataSourceImpl(gh<_i3.SharedPreferences>()));
  gh.lazySingleton<_i15.LoginRepository>(() => _i16.LoginRepositoryImpl(
        gh<_i9.NetworkInfo>(),
        gh<_i8.LoginRemoteDataSource>(),
      ));
  gh.factory<_i17.RegisterBloc>(
      () => _i17.RegisterBloc(gh<_i10.RegisterRepository>()));
  gh.lazySingleton<_i18.AppRepository>(
      () => _i19.AppRepositoryImpl(gh<_i13.AppLocalDataSource>()));
  gh.factory<_i20.LoginBloc>(() => _i20.LoginBloc(gh<_i15.LoginRepository>()));
  gh.lazySingleton<_i21.AppCubit>(
      () => _i21.AppCubit(gh<_i18.AppRepository>()));
  return getIt;
}

class _$RegisterModule extends _i22.RegisterModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:location/location.dart' as _i645;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../app/bloc/app_cubit.dart' as _i963;
import '../../features/login/data/data_sources/remote/login_remote_data_source.dart'
    as _i861;
import '../../features/login/data/repositories/login_repository_impl.dart'
    as _i1066;
import '../../features/login/domain/repositories/login_repository.dart'
    as _i902;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i664;
import '../../features/maps/presentation/bloc/map_bloc.dart' as _i30;
import '../../features/register/data/data_sources/remote/register_remote_data_source.dart'
    as _i439;
import '../../features/register/data/repositories/register_repository_impl.dart'
    as _i68;
import '../../features/register/domain/repositories/register_repository.dart'
    as _i994;
import '../../features/register/presentation/bloc/register_bloc.dart' as _i771;
import '../data_source/local/base_local_data_source.dart' as _i174;
import '../data_source/local/base_local_data_source_impl.dart' as _i99;
import '../network/network_info.dart' as _i932;
import '../repository/base_repository.dart' as _i392;
import '../repository/base_repository_impl.dart' as _i1008;
import 'di.dart' as _i913;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.getSharedPreferences(),
    preResolve: true,
  );
  gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
  gh.lazySingleton<_i645.Location>(() => registerModule.location);
  gh.lazySingleton<_i861.LoginRemoteDataSource>(
      () => _i861.LoginRemoteDataSource());
  gh.lazySingleton<_i439.RegisterRemoteDataSource>(
      () => _i439.RegisterRemoteDataSource());
  gh.lazySingleton<_i174.BaseLocalDataSource>(
      () => _i99.BaseLocalDataSourceImpl());
  gh.lazySingleton<_i392.BaseRepository>(
      () => _i1008.BaseRepositoryImpl(gh<_i174.BaseLocalDataSource>()));
  gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()));
  gh.lazySingleton<_i963.AppCubit>(
      () => _i963.AppCubit(gh<_i392.BaseRepository>()));
  gh.lazySingleton<_i994.RegisterRepository>(() => _i68.RegisterRepositoryImpl(
        gh<_i932.NetworkInfo>(),
        gh<_i439.RegisterRemoteDataSource>(),
      ));
  gh.factory<_i30.MapBloc>(() => _i30.MapBloc(gh<_i645.Location>()));
  gh.lazySingleton<_i902.LoginRepository>(() => _i1066.LoginRepositoryImpl(
        gh<_i932.NetworkInfo>(),
        gh<_i861.LoginRemoteDataSource>(),
      ));
  gh.factory<_i771.RegisterBloc>(
      () => _i771.RegisterBloc(gh<_i994.RegisterRepository>()));
  gh.factory<_i664.LoginBloc>(
      () => _i664.LoginBloc(gh<_i902.LoginRepository>()));
  return getIt;
}

class _$RegisterModule extends _i913.RegisterModule {}

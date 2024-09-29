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

import '../../app/data/data_sources/local/app_local_data_source.dart' as _i212;
import '../../app/data/data_sources/local/app_local_data_source_impl.dart'
    as _i746;
import '../../app/data/repositories/base_repository_impl.dart' as _i111;
import '../../app/domain/repositories/app_repository.dart' as _i350;
import '../../app/presentation/bloc/app_cubit.dart' as _i571;
import '../../features/maps/presentation/bloc/map_bloc.dart' as _i30;
import '../../features/sign_in/data/data_sources/remote/sign_in_remote_data_source.dart'
    as _i533;
import '../../features/sign_in/data/data_sources/remote/sign_in_remote_data_source_impl.dart'
    as _i1024;
import '../../features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i307;
import '../../features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i862;
import '../../features/sign_in/presentation/bloc/sign_in_bloc.dart' as _i640;
import '../../features/sign_up/data/data_sources/remote/sign_up_remote_data_source.dart'
    as _i964;
import '../../features/sign_up/data/data_sources/remote/sign_up_remote_data_source_impl.dart'
    as _i42;
import '../../features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i275;
import '../../features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i578;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i148;
import '../data_source/remote/base_remote_data_source.dart' as _i755;
import '../data_source/remote/base_remote_data_source_impl.dart' as _i330;
import '../network/network_info.dart' as _i932;
import '../repositories/base_repository.dart' as _i421;
import '../repositories/base_repository_impl.dart' as _i432;
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
  gh.lazySingleton<_i964.SignUpRemoteDataSource>(
      () => _i42.SignUpRemoteDataSourceImpl());
  gh.lazySingleton<_i533.SignInRemoteDataSource>(
      () => _i1024.SignInRemoteDataSourceImpl());
  gh.lazySingleton<_i421.BaseRepository>(() => _i432.BaseRepositoryImpl());
  gh.lazySingleton<_i212.AppLocalDataSource>(
      () => _i746.AppLocalDataSourceImpl());
  gh.lazySingleton<_i755.BaseRemoteDataSource>(
      () => _i330.BaseRemoteDataSourceImpl());
  gh.lazySingleton<_i350.AppRepository>(
      () => _i111.AppRepositoryImpl(gh<_i212.AppLocalDataSource>()));
  gh.lazySingleton<_i862.SignInRepository>(
      () => _i307.SignInRepositoryImpl(gh<_i533.SignInRemoteDataSource>()));
  gh.lazySingleton<_i571.AppCubit>(
      () => _i571.AppCubit(gh<_i350.AppRepository>()));
  gh.lazySingleton<_i578.SignUpRepository>(
      () => _i275.SignUpRepositoryImpl(gh<_i964.SignUpRemoteDataSource>()));
  gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()));
  gh.factory<_i30.MapBloc>(() => _i30.MapBloc(gh<_i645.Location>()));
  gh.factory<_i640.SignInBloc>(
      () => _i640.SignInBloc(gh<_i862.SignInRepository>()));
  gh.factory<_i148.SignUpBloc>(
      () => _i148.SignUpBloc(gh<_i578.SignUpRepository>()));
  return getIt;
}

class _$RegisterModule extends _i913.RegisterModule {}

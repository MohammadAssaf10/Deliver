// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:location/location.dart' as _i645;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../app/data/data_sources/local/app_local_data_source.dart' as _i212;
import '../../app/data/data_sources/local/app_local_data_source_impl.dart'
    as _i746;
import '../../app/data/repositories/app_repository_impl.dart' as _i604;
import '../../app/domain/repositories/app_repository.dart' as _i350;
import '../../app/presentation/bloc/app_cubit.dart' as _i571;
import '../../features/map/data/data_sources/remote/map_data_source.dart'
    as _i1026;
import '../../features/map/data/data_sources/remote/map_data_source_impl.dart'
    as _i115;
import '../../features/map/data/repositories/map_repository_impl.dart' as _i457;
import '../../features/map/domain/repositories/map_repository.dart' as _i973;
import '../../features/map/presentation/bloc/map_bloc.dart' as _i437;
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
import '../../features/splash/data/repositories/splash_repository_impl.dart'
    as _i554;
import '../../features/splash/domain/repositories/splash_repository.dart'
    as _i210;
import '../../features/splash/presentation/bloc/splash_bloc.dart' as _i442;
import '../../features/verification_code/data/data_sources/remote/verification_code_remote_data_source.dart'
    as _i89;
import '../../features/verification_code/data/data_sources/remote/verification_code_remote_data_source_impl.dart'
    as _i673;
import '../../features/verification_code/data/repositories/verification_code_repository_impl.dart'
    as _i328;
import '../../features/verification_code/domain/repositories/verification_code_repository.dart'
    as _i314;
import '../../features/verification_code/presentation/bloc/verification_code_bloc.dart'
    as _i59;
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
  gh.lazySingleton<_i409.GlobalKey<_i409.State<_i409.StatefulWidget>>>(
      () => registerModule.loadingDialogKey);
  gh.lazySingleton<_i964.SignUpRemoteDataSource>(
      () => _i42.SignUpRemoteDataSourceImpl());
  gh.lazySingleton<_i210.SplashRepository>(() => _i554.SplashRepositoryImpl());
  gh.lazySingleton<_i533.SignInRemoteDataSource>(
      () => _i1024.SignInRemoteDataSourceImpl());
  gh.lazySingleton<_i421.BaseRepository>(() => _i432.BaseRepositoryImpl());
  gh.lazySingleton<_i212.AppLocalDataSource>(
      () => _i746.AppLocalDataSourceImpl());
  gh.lazySingleton<_i755.BaseRemoteDataSource>(
      () => _i330.BaseRemoteDataSourceImpl());
  gh.lazySingleton<_i862.SignInRepository>(
      () => _i307.SignInRepositoryImpl(gh<_i533.SignInRemoteDataSource>()));
  gh.lazySingleton<_i89.VerificationCodeRemoteDataSource>(
      () => _i673.VerificationCodeRemoteDataSourceImpl());
  gh.lazySingleton<_i1026.MapDataSource>(() => _i115.MapDataSourceImpl());
  gh.lazySingleton<_i350.AppRepository>(
      () => _i604.AppRepositoryImpl(gh<_i212.AppLocalDataSource>()));
  gh.lazySingleton<_i973.MapRepository>(
      () => _i457.MapRepositoryImpl(gh<_i1026.MapDataSource>()));
  gh.lazySingleton<_i578.SignUpRepository>(
      () => _i275.SignUpRepositoryImpl(gh<_i964.SignUpRemoteDataSource>()));
  gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()));
  gh.factory<_i442.SplashBloc>(() => _i442.SplashBloc(
        gh<_i210.SplashRepository>(),
        gh<_i862.SignInRepository>(),
      ));
  gh.factory<_i437.MapBloc>(() => _i437.MapBloc(
        gh<_i645.Location>(),
        gh<_i973.MapRepository>(),
      ));
  gh.lazySingleton<_i314.VerificationCodeRepository>(
      () => _i328.VerificationCodeRepositoryImpl(
            gh<_i89.VerificationCodeRemoteDataSource>(),
            gh<_i862.SignInRepository>(),
          ));
  gh.factory<_i640.SignInBloc>(
      () => _i640.SignInBloc(gh<_i862.SignInRepository>()));
  gh.lazySingleton<_i571.AppCubit>(
      () => _i571.AppCubit(gh<_i350.AppRepository>()));
  gh.factory<_i148.SignUpBloc>(
      () => _i148.SignUpBloc(gh<_i578.SignUpRepository>()));
  gh.factory<_i59.VerificationCodeBloc>(
      () => _i59.VerificationCodeBloc(gh<_i314.VerificationCodeRepository>()));
  return getIt;
}

class _$RegisterModule extends _i913.RegisterModule {}

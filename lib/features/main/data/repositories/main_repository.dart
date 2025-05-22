import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/trip.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../../../../core/utils/app_extensions.dart';
import '../data_sources/remote/main_remote_data_source.dart';

@lazySingleton
class MainRepository extends BaseRepositoryImpl {
  final MainRemoteDataSource _mainRemoteDataSource;
  final FirebaseMessaging _firebaseMessaging;
  final DeviceInfoPlugin _deviceInfoPlugin;
  MainRepository(
    this._mainRemoteDataSource,
    super._networkInfo,
    this._firebaseMessaging,
    this._deviceInfoPlugin,
  );

  Future<Either<Failure, Trip?>> getCurrentTrip() async => await requestApi(
    () async => await _mainRemoteDataSource.getCurrentTrip(),
    (tripModel) {
      if (tripModel == null) return null;
      return tripModel.toDomain();
    },
  );

  Future<Either<Failure, void>> refreshFCMToken() async => await requestApi(
    () async {
      final String? fcmToken = await _firebaseMessaging.getToken();
      final AndroidDeviceInfo androidDeviceInfo =
          await _deviceInfoPlugin.androidInfo;
      final String deviceId = androidDeviceInfo.id;
      if (!fcmToken.nullOrEmpty()) {
        await _mainRemoteDataSource.refreshFCMToken(fcmToken!, deviceId);
      }
    },
    (_) {
      return;
    },
  );
}

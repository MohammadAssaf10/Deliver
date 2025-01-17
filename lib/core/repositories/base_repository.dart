import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../generated/l10n.dart';
import '../di/di.dart';
import '../error/error_handler.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../network/network_info.dart';
import '../utils/app_enums.dart';
import '../utils/app_functions.dart';

class BaseRepository {
  final NetworkInfo _networkInfo = getIt<NetworkInfo>();

  @protected
  Future<Either<Failure, T>> requestApi<T, TM>(Future<TM> Function() apiRequest,
      Future<T> Function(TM) converter) async {
    final bool isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      await Future.delayed(const Duration(milliseconds: 200));
      return Left(ServerFailure(errorMessage: S.current.networkError));
    }
    try {
      final TM result = await apiRequest(); // apiRequest returns TM
      return Right(await converter(result)); // Convert TM to T
    } catch (e, stackTrace) {
      Sentry.captureException(
        e,
        stackTrace: stackTrace,
      );
      dPrint("Error From BaseRepository: $e", stringColor: StringColor.red);
      final Failure failure = ErrorHandler.handleFailureError(e);
      return Left(failure);
    }
  }
}

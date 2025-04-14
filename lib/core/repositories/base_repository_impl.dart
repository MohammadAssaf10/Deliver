import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../error/error_handler.dart';
import '../error/failures.dart';
import '../network/network_info.dart';
import '../utils/app_enums.dart';
import '../utils/app_functions.dart';
import 'base_repository.dart';

class BaseRepositoryImpl extends BaseRepository {
  final NetworkInfo _networkInfo;

  BaseRepositoryImpl(this._networkInfo);

  @protected
  @override
  Future<Either<Failure, T>> requestApi<T, TM>(
      Future<TM> Function() apiRequest, T Function(TM) converter) async {
    final bool isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      await Future.delayed(const Duration(milliseconds: 200));
      return Left(ServerFailure(errorMessage: S.current.networkError));
    }
    try {
      final TM result = await apiRequest(); // apiRequest returns TM
      return Right(converter(result)); // Convert TM to T
    } catch (e, stackTrace) {
      // Sentry.captureException(
      //   e,
      //   stackTrace: stackTrace,
      // );
      dPrint("Exception: $e", stringColor: StringColor.red);
      dPrint("Stack trace: $stackTrace", stringColor: StringColor.red);
      final Failure failure = ErrorHandler.handleFailureError(e);
      return Left(failure);
    }
  }
}

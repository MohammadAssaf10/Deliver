import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../error/failure.dart';

abstract class BaseRepository {
  @protected
  Future<Either<Failure, T>> requestApi<T, TM>(
    Future<TM> Function() apiRequest,
    T Function(TM) converter,
  );
}

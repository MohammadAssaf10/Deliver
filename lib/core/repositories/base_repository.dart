import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> requestApi<T, TM>(
    Future<TM> Function() apiRequest,
    T Function(TM) converter,
  );
}

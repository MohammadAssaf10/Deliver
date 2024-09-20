import 'package:dartz/dartz.dart';

import '../error/failure.dart';
import '../utils/app_enums.dart';

abstract class BaseRepository {
  Future<Either<Failure, Language>> getAppLanguage();

  Future<Either<Failure, void>> setAppLanguage(Language language);
}

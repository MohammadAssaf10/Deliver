import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/utils/app_enums.dart';

abstract class AppRepository {
  Future<Either<Failure, Language>> getAppLanguage();

  Future<Either<Failure, void>> setAppLanguage(Language language);
}

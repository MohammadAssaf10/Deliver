abstract class GenericExceptions implements Exception {
  final String exceptionMessage;

  const GenericExceptions(this.exceptionMessage);
}

class ServerException extends GenericExceptions {
  const ServerException({required String? error})
      : super(error ?? "Something went wrong");

  @override
  String toString() {
    return 'ServerException{exceptionMessage: $exceptionMessage}';
  }
}

class CacheException extends GenericExceptions {
  const CacheException({required String? error})
      : super(error ?? "Something went wrong");

  @override
  String toString() {
    return 'CacheException{exceptionMessage: $exceptionMessage}';
  }
}

class GeneralException extends GenericExceptions {
  const GeneralException({
    String errorMessage = "Something went wrong",
  }) : super(errorMessage);

  @override
  String toString() {
    return 'GeneralException{exceptionMessage: $exceptionMessage}';
  }
}

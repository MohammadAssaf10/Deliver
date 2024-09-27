abstract class GenericExceptions implements Exception {
  final String exceptionMessage;

  const GenericExceptions(this.exceptionMessage);
}

class ServerException extends GenericExceptions {
  const ServerException({required String? error})
      : super(error ?? "Something went wrong");
}

class CacheException extends GenericExceptions {
  const CacheException({required String? error})
      : super(error ?? "Something went wrong");
}

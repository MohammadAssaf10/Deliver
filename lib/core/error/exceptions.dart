abstract class GenericExceptions implements Exception {
  final String exceptionMessage;

  const GenericExceptions(this.exceptionMessage);
}

class ServerException extends GenericExceptions {
  const ServerException({String error = "Something went wrong"}) : super(error);
}

class CacheException extends GenericExceptions {
  const CacheException({String error = "Something went wrong"}) : super(error);
}

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String error;

  const Failure(this.error);

  @override
  List<Object> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure({String error = "Something went wrong"}) : super(error);
}

class CacheFailure extends Failure {
  const CacheFailure({String error = "Something went wrong"}) : super(error);
}

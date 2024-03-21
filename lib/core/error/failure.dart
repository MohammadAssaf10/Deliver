class Failure implements Exception {
  final int? code;
  final String? message;

  Failure({required this.code, required this.message});

  @override
  String toString() {
    return 'Failure{code: $code, message: $message}';
  }
}
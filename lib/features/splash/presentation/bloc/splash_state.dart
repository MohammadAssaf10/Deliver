import 'package:built_value/built_value.dart';

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  bool? get isAuth;

  bool get isTokenUpToDate;

  bool get isError;

  String get errorMessage;

  SplashState._();

  factory SplashState([void Function(SplashStateBuilder) updates]) =
  _$SplashState;

  factory SplashState.initial() => SplashState(
        (b) => b
      ..isAuth = null
      ..isTokenUpToDate = false
      ..isError = false
      ..errorMessage = '',
  );
}

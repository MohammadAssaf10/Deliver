import 'package:built_value/built_value.dart';

part 'splash_event.g.dart';

abstract class SplashEvent {}

abstract class CheckUserAuthentication extends SplashEvent
    implements Built<CheckUserAuthentication, CheckUserAuthenticationBuilder> {
  CheckUserAuthentication._();

  factory CheckUserAuthentication(
          [void Function(CheckUserAuthenticationBuilder) updates]) =
      _$CheckUserAuthentication;
}
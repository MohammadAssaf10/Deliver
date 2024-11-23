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

abstract class TokenNeedRefresh extends SplashEvent
    implements Built<TokenNeedRefresh, TokenNeedRefreshBuilder> {
  TokenNeedRefresh._();

  factory TokenNeedRefresh([void Function(TokenNeedRefreshBuilder) updates]) =
      _$TokenNeedRefresh;
}

abstract class RefreshToken extends SplashEvent
    implements Built<RefreshToken, RefreshTokenBuilder> {
  RefreshToken._();

  factory RefreshToken([void Function(RefreshTokenBuilder) updates]) =
      _$RefreshToken;
}

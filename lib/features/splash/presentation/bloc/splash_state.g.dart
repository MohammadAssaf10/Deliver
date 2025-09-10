// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashState extends SplashState {
  @override
  final bool? isAuth;
  @override
  final bool isError;
  @override
  final String errorMessage;

  factory _$SplashState([void Function(SplashStateBuilder)? updates]) =>
      (SplashStateBuilder()..update(updates))._build();

  _$SplashState._({
    this.isAuth,
    required this.isError,
    required this.errorMessage,
  }) : super._();
  @override
  SplashState rebuild(void Function(SplashStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashStateBuilder toBuilder() => SplashStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashState &&
        isAuth == other.isAuth &&
        isError == other.isError &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isAuth.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SplashState')
          ..add('isAuth', isAuth)
          ..add('isError', isError)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class SplashStateBuilder implements Builder<SplashState, SplashStateBuilder> {
  _$SplashState? _$v;

  bool? _isAuth;
  bool? get isAuth => _$this._isAuth;
  set isAuth(bool? isAuth) => _$this._isAuth = isAuth;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  SplashStateBuilder();

  SplashStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isAuth = $v.isAuth;
      _isError = $v.isError;
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashState other) {
    _$v = other as _$SplashState;
  }

  @override
  void update(void Function(SplashStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SplashState build() => _build();

  _$SplashState _build() {
    final _$result =
        _$v ??
        _$SplashState._(
          isAuth: isAuth,
          isError: BuiltValueNullFieldError.checkNotNull(
            isError,
            r'SplashState',
            'isError',
          ),
          errorMessage: BuiltValueNullFieldError.checkNotNull(
            errorMessage,
            r'SplashState',
            'errorMessage',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

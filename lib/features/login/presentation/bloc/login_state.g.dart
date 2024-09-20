// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginState extends LoginState {
  @override
  final bool passwordVisible;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isError;
  @override
  final String message;

  factory _$LoginState([void Function(LoginStateBuilder)? updates]) =>
      (new LoginStateBuilder()..update(updates))._build();

  _$LoginState._(
      {required this.passwordVisible,
      required this.isLoading,
      required this.isSuccess,
      required this.isError,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passwordVisible, r'LoginState', 'passwordVisible');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'LoginState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isSuccess, r'LoginState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(isError, r'LoginState', 'isError');
    BuiltValueNullFieldError.checkNotNull(message, r'LoginState', 'message');
  }

  @override
  LoginState rebuild(void Function(LoginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        passwordVisible == other.passwordVisible &&
        isLoading == other.isLoading &&
        isSuccess == other.isSuccess &&
        isError == other.isError &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passwordVisible.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginState')
          ..add('passwordVisible', passwordVisible)
          ..add('isLoading', isLoading)
          ..add('isSuccess', isSuccess)
          ..add('isError', isError)
          ..add('message', message))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState? _$v;

  bool? _passwordVisible;
  bool? get passwordVisible => _$this._passwordVisible;
  set passwordVisible(bool? passwordVisible) =>
      _$this._passwordVisible = passwordVisible;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passwordVisible = $v.passwordVisible;
      _isLoading = $v.isLoading;
      _isSuccess = $v.isSuccess;
      _isError = $v.isError;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginState;
  }

  @override
  void update(void Function(LoginStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginState build() => _build();

  _$LoginState _build() {
    final _$result = _$v ??
        new _$LoginState._(
            passwordVisible: BuiltValueNullFieldError.checkNotNull(
                passwordVisible, r'LoginState', 'passwordVisible'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'LoginState', 'isLoading'),
            isSuccess: BuiltValueNullFieldError.checkNotNull(
                isSuccess, r'LoginState', 'isSuccess'),
            isError: BuiltValueNullFieldError.checkNotNull(
                isError, r'LoginState', 'isError'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'LoginState', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

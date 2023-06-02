// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_bloc.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangePasswordState extends ChangePasswordState {
  factory _$ChangePasswordState(
          [void Function(ChangePasswordStateBuilder)? updates]) =>
      (new ChangePasswordStateBuilder()..update(updates))._build();

  _$ChangePasswordState._() : super._();

  @override
  ChangePasswordState rebuild(
          void Function(ChangePasswordStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangePasswordStateBuilder toBuilder() =>
      new ChangePasswordStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangePasswordState;
  }

  @override
  int get hashCode {
    return 977209109;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ChangePasswordState').toString();
  }
}

class ChangePasswordStateBuilder
    implements Builder<ChangePasswordState, ChangePasswordStateBuilder> {
  _$ChangePasswordState? _$v;

  ChangePasswordStateBuilder();

  @override
  void replace(ChangePasswordState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangePasswordState;
  }

  @override
  void update(void Function(ChangePasswordStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangePasswordState build() => _build();

  _$ChangePasswordState _build() {
    final _$result = _$v ?? new _$ChangePasswordState._();
    replace(_$result);
    return _$result;
  }
}

class _$Login extends Login {
  @override
  final LoginRequest loginRequest;

  factory _$Login([void Function(LoginBuilder)? updates]) =>
      (new LoginBuilder()..update(updates))._build();

  _$Login._({required this.loginRequest}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        loginRequest, r'Login', 'loginRequest');
  }

  @override
  Login rebuild(void Function(LoginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginBuilder toBuilder() => new LoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Login && loginRequest == other.loginRequest;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, loginRequest.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Login')
          ..add('loginRequest', loginRequest))
        .toString();
  }
}

class LoginBuilder implements Builder<Login, LoginBuilder> {
  _$Login? _$v;

  LoginRequest? _loginRequest;
  LoginRequest? get loginRequest => _$this._loginRequest;
  set loginRequest(LoginRequest? loginRequest) =>
      _$this._loginRequest = loginRequest;

  LoginBuilder();

  LoginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loginRequest = $v.loginRequest;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Login other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Login;
  }

  @override
  void update(void Function(LoginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Login build() => _build();

  _$Login _build() {
    final _$result = _$v ??
        new _$Login._(
            loginRequest: BuiltValueNullFieldError.checkNotNull(
                loginRequest, r'Login', 'loginRequest'));
    replace(_$result);
    return _$result;
  }
}

class _$LoginState extends LoginState {
  @override
  final bool passwordVisible;
  @override
  final bool isLogin;
  @override
  final bool isLoading;
  @override
  final bool error;
  @override
  final String errorMessage;

  factory _$LoginState([void Function(LoginStateBuilder)? updates]) =>
      (new LoginStateBuilder()..update(updates))._build();

  _$LoginState._(
      {required this.passwordVisible,
      required this.isLogin,
      required this.isLoading,
      required this.error,
      required this.errorMessage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passwordVisible, r'LoginState', 'passwordVisible');
    BuiltValueNullFieldError.checkNotNull(isLogin, r'LoginState', 'isLogin');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'LoginState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'LoginState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        errorMessage, r'LoginState', 'errorMessage');
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
        isLogin == other.isLogin &&
        isLoading == other.isLoading &&
        error == other.error &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passwordVisible.hashCode);
    _$hash = $jc(_$hash, isLogin.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginState')
          ..add('passwordVisible', passwordVisible)
          ..add('isLogin', isLogin)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState? _$v;

  bool? _passwordVisible;
  bool? get passwordVisible => _$this._passwordVisible;
  set passwordVisible(bool? passwordVisible) =>
      _$this._passwordVisible = passwordVisible;

  bool? _isLogin;
  bool? get isLogin => _$this._isLogin;
  set isLogin(bool? isLogin) => _$this._isLogin = isLogin;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passwordVisible = $v.passwordVisible;
      _isLogin = $v.isLogin;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _errorMessage = $v.errorMessage;
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
            isLogin: BuiltValueNullFieldError.checkNotNull(
                isLogin, r'LoginState', 'isLogin'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'LoginState', 'isLoading'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'LoginState', 'error'),
            errorMessage: BuiltValueNullFieldError.checkNotNull(
                errorMessage, r'LoginState', 'errorMessage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_bloc.dart';

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

class _$Register extends Register {
  @override
  final RegisterRequest registerRequest;

  factory _$Register([void Function(RegisterBuilder)? updates]) =>
      (new RegisterBuilder()..update(updates))._build();

  _$Register._({required this.registerRequest}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        registerRequest, r'Register', 'registerRequest');
  }

  @override
  Register rebuild(void Function(RegisterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterBuilder toBuilder() => new RegisterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Register && registerRequest == other.registerRequest;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, registerRequest.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Register')
          ..add('registerRequest', registerRequest))
        .toString();
  }
}

class RegisterBuilder implements Builder<Register, RegisterBuilder> {
  _$Register? _$v;

  RegisterRequest? _registerRequest;
  RegisterRequest? get registerRequest => _$this._registerRequest;
  set registerRequest(RegisterRequest? registerRequest) =>
      _$this._registerRequest = registerRequest;

  RegisterBuilder();

  RegisterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _registerRequest = $v.registerRequest;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Register other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Register;
  }

  @override
  void update(void Function(RegisterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Register build() => _build();

  _$Register _build() {
    final _$result = _$v ??
        new _$Register._(
            registerRequest: BuiltValueNullFieldError.checkNotNull(
                registerRequest, r'Register', 'registerRequest'));
    replace(_$result);
    return _$result;
  }
}

class _$RegisterState extends RegisterState {
  @override
  final bool passwordVisible;
  @override
  final bool isRegister;
  @override
  final bool isLoading;
  @override
  final bool error;
  @override
  final String errorMessage;

  factory _$RegisterState([void Function(RegisterStateBuilder)? updates]) =>
      (new RegisterStateBuilder()..update(updates))._build();

  _$RegisterState._(
      {required this.passwordVisible,
      required this.isRegister,
      required this.isLoading,
      required this.error,
      required this.errorMessage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passwordVisible, r'RegisterState', 'passwordVisible');
    BuiltValueNullFieldError.checkNotNull(
        isRegister, r'RegisterState', 'isRegister');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'RegisterState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'RegisterState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        errorMessage, r'RegisterState', 'errorMessage');
  }

  @override
  RegisterState rebuild(void Function(RegisterStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterStateBuilder toBuilder() => new RegisterStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterState &&
        passwordVisible == other.passwordVisible &&
        isRegister == other.isRegister &&
        isLoading == other.isLoading &&
        error == other.error &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passwordVisible.hashCode);
    _$hash = $jc(_$hash, isRegister.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterState')
          ..add('passwordVisible', passwordVisible)
          ..add('isRegister', isRegister)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class RegisterStateBuilder
    implements Builder<RegisterState, RegisterStateBuilder> {
  _$RegisterState? _$v;

  bool? _passwordVisible;
  bool? get passwordVisible => _$this._passwordVisible;
  set passwordVisible(bool? passwordVisible) =>
      _$this._passwordVisible = passwordVisible;

  bool? _isRegister;
  bool? get isRegister => _$this._isRegister;
  set isRegister(bool? isRegister) => _$this._isRegister = isRegister;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  RegisterStateBuilder();

  RegisterStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passwordVisible = $v.passwordVisible;
      _isRegister = $v.isRegister;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterState;
  }

  @override
  void update(void Function(RegisterStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterState build() => _build();

  _$RegisterState _build() {
    final _$result = _$v ??
        new _$RegisterState._(
            passwordVisible: BuiltValueNullFieldError.checkNotNull(
                passwordVisible, r'RegisterState', 'passwordVisible'),
            isRegister: BuiltValueNullFieldError.checkNotNull(
                isRegister, r'RegisterState', 'isRegister'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'RegisterState', 'isLoading'),
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'RegisterState', 'error'),
            errorMessage: BuiltValueNullFieldError.checkNotNull(
                errorMessage, r'RegisterState', 'errorMessage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

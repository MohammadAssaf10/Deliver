// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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
  final String message;

  factory _$RegisterState([void Function(RegisterStateBuilder)? updates]) =>
      (new RegisterStateBuilder()..update(updates))._build();

  _$RegisterState._(
      {required this.passwordVisible,
      required this.isRegister,
      required this.isLoading,
      required this.error,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passwordVisible, r'RegisterState', 'passwordVisible');
    BuiltValueNullFieldError.checkNotNull(
        isRegister, r'RegisterState', 'isRegister');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'RegisterState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'RegisterState', 'error');
    BuiltValueNullFieldError.checkNotNull(message, r'RegisterState', 'message');
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
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passwordVisible.hashCode);
    _$hash = $jc(_$hash, isRegister.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
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
          ..add('message', message))
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

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  RegisterStateBuilder();

  RegisterStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passwordVisible = $v.passwordVisible;
      _isRegister = $v.isRegister;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _message = $v.message;
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
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'RegisterState', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

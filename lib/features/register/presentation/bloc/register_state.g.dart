// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterState extends RegisterState {
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

  factory _$RegisterState([void Function(RegisterStateBuilder)? updates]) =>
      (new RegisterStateBuilder()..update(updates))._build();

  _$RegisterState._(
      {required this.passwordVisible,
      required this.isLoading,
      required this.isSuccess,
      required this.isError,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passwordVisible, r'RegisterState', 'passwordVisible');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'RegisterState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isSuccess, r'RegisterState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(isError, r'RegisterState', 'isError');
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
    return (newBuiltValueToStringHelper(r'RegisterState')
          ..add('passwordVisible', passwordVisible)
          ..add('isLoading', isLoading)
          ..add('isSuccess', isSuccess)
          ..add('isError', isError)
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

  RegisterStateBuilder();

  RegisterStateBuilder get _$this {
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
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'RegisterState', 'isLoading'),
            isSuccess: BuiltValueNullFieldError.checkNotNull(
                isSuccess, r'RegisterState', 'isSuccess'),
            isError: BuiltValueNullFieldError.checkNotNull(
                isError, r'RegisterState', 'isError'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'RegisterState', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

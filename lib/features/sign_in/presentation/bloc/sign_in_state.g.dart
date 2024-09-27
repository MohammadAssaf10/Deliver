// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignInState extends SignInState {
  @override
  final bool passwordVisible;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isError;

  factory _$SignInState([void Function(SignInStateBuilder)? updates]) =>
      (new SignInStateBuilder()..update(updates))._build();

  _$SignInState._(
      {required this.passwordVisible,
      required this.isLoading,
      required this.isSuccess,
      required this.isError})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passwordVisible, r'SignInState', 'passwordVisible');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'SignInState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isSuccess, r'SignInState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(isError, r'SignInState', 'isError');
  }

  @override
  SignInState rebuild(void Function(SignInStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInStateBuilder toBuilder() => new SignInStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInState &&
        passwordVisible == other.passwordVisible &&
        isLoading == other.isLoading &&
        isSuccess == other.isSuccess &&
        isError == other.isError;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passwordVisible.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignInState')
          ..add('passwordVisible', passwordVisible)
          ..add('isLoading', isLoading)
          ..add('isSuccess', isSuccess)
          ..add('isError', isError))
        .toString();
  }
}

class SignInStateBuilder implements Builder<SignInState, SignInStateBuilder> {
  _$SignInState? _$v;

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

  SignInStateBuilder();

  SignInStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passwordVisible = $v.passwordVisible;
      _isLoading = $v.isLoading;
      _isSuccess = $v.isSuccess;
      _isError = $v.isError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignInState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignInState;
  }

  @override
  void update(void Function(SignInStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignInState build() => _build();

  _$SignInState _build() {
    final _$result = _$v ??
        new _$SignInState._(
            passwordVisible: BuiltValueNullFieldError.checkNotNull(
                passwordVisible, r'SignInState', 'passwordVisible'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'SignInState', 'isLoading'),
            isSuccess: BuiltValueNullFieldError.checkNotNull(
                isSuccess, r'SignInState', 'isSuccess'),
            isError: BuiltValueNullFieldError.checkNotNull(
                isError, r'SignInState', 'isError'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

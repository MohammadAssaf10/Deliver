// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignUpState extends SignUpState {
  @override
  final bool passwordVisible;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool isSuccess;

  factory _$SignUpState([void Function(SignUpStateBuilder)? updates]) =>
      (new SignUpStateBuilder()..update(updates))._build();

  _$SignUpState._({
    required this.passwordVisible,
    required this.isLoading,
    required this.isError,
    required this.isSuccess,
  }) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      passwordVisible,
      r'SignUpState',
      'passwordVisible',
    );
    BuiltValueNullFieldError.checkNotNull(
      isLoading,
      r'SignUpState',
      'isLoading',
    );
    BuiltValueNullFieldError.checkNotNull(isError, r'SignUpState', 'isError');
    BuiltValueNullFieldError.checkNotNull(
      isSuccess,
      r'SignUpState',
      'isSuccess',
    );
  }

  @override
  SignUpState rebuild(void Function(SignUpStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpStateBuilder toBuilder() => new SignUpStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpState &&
        passwordVisible == other.passwordVisible &&
        isLoading == other.isLoading &&
        isError == other.isError &&
        isSuccess == other.isSuccess;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passwordVisible.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignUpState')
          ..add('passwordVisible', passwordVisible)
          ..add('isLoading', isLoading)
          ..add('isError', isError)
          ..add('isSuccess', isSuccess))
        .toString();
  }
}

class SignUpStateBuilder implements Builder<SignUpState, SignUpStateBuilder> {
  _$SignUpState? _$v;

  bool? _passwordVisible;
  bool? get passwordVisible => _$this._passwordVisible;
  set passwordVisible(bool? passwordVisible) =>
      _$this._passwordVisible = passwordVisible;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  SignUpStateBuilder();

  SignUpStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passwordVisible = $v.passwordVisible;
      _isLoading = $v.isLoading;
      _isError = $v.isError;
      _isSuccess = $v.isSuccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignUpState;
  }

  @override
  void update(void Function(SignUpStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignUpState build() => _build();

  _$SignUpState _build() {
    final _$result =
        _$v ??
        new _$SignUpState._(
          passwordVisible: BuiltValueNullFieldError.checkNotNull(
            passwordVisible,
            r'SignUpState',
            'passwordVisible',
          ),
          isLoading: BuiltValueNullFieldError.checkNotNull(
            isLoading,
            r'SignUpState',
            'isLoading',
          ),
          isError: BuiltValueNullFieldError.checkNotNull(
            isError,
            r'SignUpState',
            'isError',
          ),
          isSuccess: BuiltValueNullFieldError.checkNotNull(
            isSuccess,
            r'SignUpState',
            'isSuccess',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

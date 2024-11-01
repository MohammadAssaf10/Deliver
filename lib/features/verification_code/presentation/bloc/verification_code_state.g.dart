// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_code_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerificationCodeState extends VerificationCodeState {
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isError;

  factory _$VerificationCodeState(
          [void Function(VerificationCodeStateBuilder)? updates]) =>
      (new VerificationCodeStateBuilder()..update(updates))._build();

  _$VerificationCodeState._(
      {required this.isLoading, required this.isSuccess, required this.isError})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'VerificationCodeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isSuccess, r'VerificationCodeState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(
        isError, r'VerificationCodeState', 'isError');
  }

  @override
  VerificationCodeState rebuild(
          void Function(VerificationCodeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerificationCodeStateBuilder toBuilder() =>
      new VerificationCodeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerificationCodeState &&
        isLoading == other.isLoading &&
        isSuccess == other.isSuccess &&
        isError == other.isError;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerificationCodeState')
          ..add('isLoading', isLoading)
          ..add('isSuccess', isSuccess)
          ..add('isError', isError))
        .toString();
  }
}

class VerificationCodeStateBuilder
    implements Builder<VerificationCodeState, VerificationCodeStateBuilder> {
  _$VerificationCodeState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  VerificationCodeStateBuilder();

  VerificationCodeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _isSuccess = $v.isSuccess;
      _isError = $v.isError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerificationCodeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerificationCodeState;
  }

  @override
  void update(void Function(VerificationCodeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerificationCodeState build() => _build();

  _$VerificationCodeState _build() {
    final _$result = _$v ??
        new _$VerificationCodeState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'VerificationCodeState', 'isLoading'),
            isSuccess: BuiltValueNullFieldError.checkNotNull(
                isSuccess, r'VerificationCodeState', 'isSuccess'),
            isError: BuiltValueNullFieldError.checkNotNull(
                isError, r'VerificationCodeState', 'isError'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

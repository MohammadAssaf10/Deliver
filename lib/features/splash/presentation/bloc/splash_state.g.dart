// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashState extends SplashState {
  @override
  final bool? isAuth;
  @override
  final bool isTokenUpToDate;
  @override
  final bool isError;

  factory _$SplashState([void Function(SplashStateBuilder)? updates]) =>
      (new SplashStateBuilder()..update(updates))._build();

  _$SplashState._(
      {this.isAuth, required this.isTokenUpToDate, required this.isError})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isTokenUpToDate, r'SplashState', 'isTokenUpToDate');
    BuiltValueNullFieldError.checkNotNull(isError, r'SplashState', 'isError');
  }

  @override
  SplashState rebuild(void Function(SplashStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashStateBuilder toBuilder() => new SplashStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashState &&
        isAuth == other.isAuth &&
        isTokenUpToDate == other.isTokenUpToDate &&
        isError == other.isError;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isAuth.hashCode);
    _$hash = $jc(_$hash, isTokenUpToDate.hashCode);
    _$hash = $jc(_$hash, isError.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SplashState')
          ..add('isAuth', isAuth)
          ..add('isTokenUpToDate', isTokenUpToDate)
          ..add('isError', isError))
        .toString();
  }
}

class SplashStateBuilder implements Builder<SplashState, SplashStateBuilder> {
  _$SplashState? _$v;

  bool? _isAuth;
  bool? get isAuth => _$this._isAuth;
  set isAuth(bool? isAuth) => _$this._isAuth = isAuth;

  bool? _isTokenUpToDate;
  bool? get isTokenUpToDate => _$this._isTokenUpToDate;
  set isTokenUpToDate(bool? isTokenUpToDate) =>
      _$this._isTokenUpToDate = isTokenUpToDate;

  bool? _isError;
  bool? get isError => _$this._isError;
  set isError(bool? isError) => _$this._isError = isError;

  SplashStateBuilder();

  SplashStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isAuth = $v.isAuth;
      _isTokenUpToDate = $v.isTokenUpToDate;
      _isError = $v.isError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplashState;
  }

  @override
  void update(void Function(SplashStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SplashState build() => _build();

  _$SplashState _build() {
    final _$result = _$v ??
        new _$SplashState._(
            isAuth: isAuth,
            isTokenUpToDate: BuiltValueNullFieldError.checkNotNull(
                isTokenUpToDate, r'SplashState', 'isTokenUpToDate'),
            isError: BuiltValueNullFieldError.checkNotNull(
                isError, r'SplashState', 'isError'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

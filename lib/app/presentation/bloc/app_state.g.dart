// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final Language appLanguage;
  @override
  final bool isAuth;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._({required this.appLanguage, required this.isAuth}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      appLanguage,
      r'AppState',
      'appLanguage',
    );
    BuiltValueNullFieldError.checkNotNull(isAuth, r'AppState', 'isAuth');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        appLanguage == other.appLanguage &&
        isAuth == other.isAuth;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appLanguage.hashCode);
    _$hash = $jc(_$hash, isAuth.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('appLanguage', appLanguage)
          ..add('isAuth', isAuth))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  Language? _appLanguage;
  Language? get appLanguage => _$this._appLanguage;
  set appLanguage(Language? appLanguage) => _$this._appLanguage = appLanguage;

  bool? _isAuth;
  bool? get isAuth => _$this._isAuth;
  set isAuth(bool? isAuth) => _$this._isAuth = isAuth;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appLanguage = $v.appLanguage;
      _isAuth = $v.isAuth;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    final _$result =
        _$v ??
        new _$AppState._(
          appLanguage: BuiltValueNullFieldError.checkNotNull(
            appLanguage,
            r'AppState',
            'appLanguage',
          ),
          isAuth: BuiltValueNullFieldError.checkNotNull(
            isAuth,
            r'AppState',
            'isAuth',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

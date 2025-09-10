// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final Language appLanguage;
  @override
  final BlocStatus profileStatus;
  @override
  final Profile? profile;
  @override
  final BlocStatus logoutStatus;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (AppStateBuilder()..update(updates))._build();

  _$AppState._({
    required this.appLanguage,
    required this.profileStatus,
    this.profile,
    required this.logoutStatus,
  }) : super._();
  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        appLanguage == other.appLanguage &&
        profileStatus == other.profileStatus &&
        profile == other.profile &&
        logoutStatus == other.logoutStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appLanguage.hashCode);
    _$hash = $jc(_$hash, profileStatus.hashCode);
    _$hash = $jc(_$hash, profile.hashCode);
    _$hash = $jc(_$hash, logoutStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('appLanguage', appLanguage)
          ..add('profileStatus', profileStatus)
          ..add('profile', profile)
          ..add('logoutStatus', logoutStatus))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  Language? _appLanguage;
  Language? get appLanguage => _$this._appLanguage;
  set appLanguage(Language? appLanguage) => _$this._appLanguage = appLanguage;

  BlocStatus? _profileStatus;
  BlocStatus? get profileStatus => _$this._profileStatus;
  set profileStatus(BlocStatus? profileStatus) =>
      _$this._profileStatus = profileStatus;

  Profile? _profile;
  Profile? get profile => _$this._profile;
  set profile(Profile? profile) => _$this._profile = profile;

  BlocStatus? _logoutStatus;
  BlocStatus? get logoutStatus => _$this._logoutStatus;
  set logoutStatus(BlocStatus? logoutStatus) =>
      _$this._logoutStatus = logoutStatus;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appLanguage = $v.appLanguage;
      _profileStatus = $v.profileStatus;
      _profile = $v.profile;
      _logoutStatus = $v.logoutStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
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
        _$AppState._(
          appLanguage: BuiltValueNullFieldError.checkNotNull(
            appLanguage,
            r'AppState',
            'appLanguage',
          ),
          profileStatus: BuiltValueNullFieldError.checkNotNull(
            profileStatus,
            r'AppState',
            'profileStatus',
          ),
          profile: profile,
          logoutStatus: BuiltValueNullFieldError.checkNotNull(
            logoutStatus,
            r'AppState',
            'logoutStatus',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

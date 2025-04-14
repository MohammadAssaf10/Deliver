// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileDetailsState extends ProfileDetailsState {
  @override
  final bool isLoading;
  @override
  final XFile? profileImageFile;
  @override
  final String profileImage;

  factory _$ProfileDetailsState(
          [void Function(ProfileDetailsStateBuilder)? updates]) =>
      (new ProfileDetailsStateBuilder()..update(updates))._build();

  _$ProfileDetailsState._(
      {required this.isLoading,
      this.profileImageFile,
      required this.profileImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ProfileDetailsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        profileImage, r'ProfileDetailsState', 'profileImage');
  }

  @override
  ProfileDetailsState rebuild(
          void Function(ProfileDetailsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileDetailsStateBuilder toBuilder() =>
      new ProfileDetailsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileDetailsState &&
        isLoading == other.isLoading &&
        profileImageFile == other.profileImageFile &&
        profileImage == other.profileImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, profileImageFile.hashCode);
    _$hash = $jc(_$hash, profileImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileDetailsState')
          ..add('isLoading', isLoading)
          ..add('profileImageFile', profileImageFile)
          ..add('profileImage', profileImage))
        .toString();
  }
}

class ProfileDetailsStateBuilder
    implements Builder<ProfileDetailsState, ProfileDetailsStateBuilder> {
  _$ProfileDetailsState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  XFile? _profileImageFile;
  XFile? get profileImageFile => _$this._profileImageFile;
  set profileImageFile(XFile? profileImageFile) =>
      _$this._profileImageFile = profileImageFile;

  String? _profileImage;
  String? get profileImage => _$this._profileImage;
  set profileImage(String? profileImage) => _$this._profileImage = profileImage;

  ProfileDetailsStateBuilder();

  ProfileDetailsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _profileImageFile = $v.profileImageFile;
      _profileImage = $v.profileImage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileDetailsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileDetailsState;
  }

  @override
  void update(void Function(ProfileDetailsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileDetailsState build() => _build();

  _$ProfileDetailsState _build() {
    final _$result = _$v ??
        new _$ProfileDetailsState._(
          isLoading: BuiltValueNullFieldError.checkNotNull(
              isLoading, r'ProfileDetailsState', 'isLoading'),
          profileImageFile: profileImageFile,
          profileImage: BuiltValueNullFieldError.checkNotNull(
              profileImage, r'ProfileDetailsState', 'profileImage'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

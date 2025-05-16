// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetProfileData extends SetProfileData {
  @override
  final Profile profile;

  factory _$SetProfileData([void Function(SetProfileDataBuilder)? updates]) =>
      (new SetProfileDataBuilder()..update(updates))._build();

  _$SetProfileData._({required this.profile}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      profile,
      r'SetProfileData',
      'profile',
    );
  }

  @override
  SetProfileData rebuild(void Function(SetProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetProfileDataBuilder toBuilder() =>
      new SetProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetProfileData && profile == other.profile;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, profile.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetProfileData')
      ..add('profile', profile)).toString();
  }
}

class SetProfileDataBuilder
    implements Builder<SetProfileData, SetProfileDataBuilder> {
  _$SetProfileData? _$v;

  Profile? _profile;
  Profile? get profile => _$this._profile;
  set profile(Profile? profile) => _$this._profile = profile;

  SetProfileDataBuilder();

  SetProfileDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _profile = $v.profile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetProfileData;
  }

  @override
  void update(void Function(SetProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetProfileData build() => _build();

  _$SetProfileData _build() {
    final _$result =
        _$v ??
        new _$SetProfileData._(
          profile: BuiltValueNullFieldError.checkNotNull(
            profile,
            r'SetProfileData',
            'profile',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$SelectProfileImage extends SelectProfileImage {
  @override
  final ImageSource imageSource;

  factory _$SelectProfileImage([
    void Function(SelectProfileImageBuilder)? updates,
  ]) => (new SelectProfileImageBuilder()..update(updates))._build();

  _$SelectProfileImage._({required this.imageSource}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
      imageSource,
      r'SelectProfileImage',
      'imageSource',
    );
  }

  @override
  SelectProfileImage rebuild(
    void Function(SelectProfileImageBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  SelectProfileImageBuilder toBuilder() =>
      new SelectProfileImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SelectProfileImage && imageSource == other.imageSource;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, imageSource.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SelectProfileImage')
      ..add('imageSource', imageSource)).toString();
  }
}

class SelectProfileImageBuilder
    implements Builder<SelectProfileImage, SelectProfileImageBuilder> {
  _$SelectProfileImage? _$v;

  ImageSource? _imageSource;
  ImageSource? get imageSource => _$this._imageSource;
  set imageSource(ImageSource? imageSource) =>
      _$this._imageSource = imageSource;

  SelectProfileImageBuilder();

  SelectProfileImageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageSource = $v.imageSource;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SelectProfileImage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SelectProfileImage;
  }

  @override
  void update(void Function(SelectProfileImageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SelectProfileImage build() => _build();

  _$SelectProfileImage _build() {
    final _$result =
        _$v ??
        new _$SelectProfileImage._(
          imageSource: BuiltValueNullFieldError.checkNotNull(
            imageSource,
            r'SelectProfileImage',
            'imageSource',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$UpdateProfileData extends UpdateProfileData {
  factory _$UpdateProfileData([
    void Function(UpdateProfileDataBuilder)? updates,
  ]) => (new UpdateProfileDataBuilder()..update(updates))._build();

  _$UpdateProfileData._() : super._();

  @override
  UpdateProfileData rebuild(void Function(UpdateProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateProfileDataBuilder toBuilder() =>
      new UpdateProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateProfileData;
  }

  @override
  int get hashCode {
    return 151947136;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'UpdateProfileData').toString();
  }
}

class UpdateProfileDataBuilder
    implements Builder<UpdateProfileData, UpdateProfileDataBuilder> {
  _$UpdateProfileData? _$v;

  UpdateProfileDataBuilder();

  @override
  void replace(UpdateProfileData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateProfileData;
  }

  @override
  void update(void Function(UpdateProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProfileData build() => _build();

  _$UpdateProfileData _build() {
    final _$result = _$v ?? new _$UpdateProfileData._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

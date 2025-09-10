// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetProfileData extends SetProfileData {
  factory _$SetProfileData([void Function(SetProfileDataBuilder)? updates]) =>
      (SetProfileDataBuilder()..update(updates))._build();

  _$SetProfileData._() : super._();
  @override
  SetProfileData rebuild(void Function(SetProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetProfileDataBuilder toBuilder() => SetProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetProfileData;
  }

  @override
  int get hashCode {
    return 554189692;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'SetProfileData').toString();
  }
}

class SetProfileDataBuilder
    implements Builder<SetProfileData, SetProfileDataBuilder> {
  _$SetProfileData? _$v;

  SetProfileDataBuilder();

  @override
  void replace(SetProfileData other) {
    _$v = other as _$SetProfileData;
  }

  @override
  void update(void Function(SetProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetProfileData build() => _build();

  _$SetProfileData _build() {
    final _$result = _$v ?? _$SetProfileData._();
    replace(_$result);
    return _$result;
  }
}

class _$SelectProfileImage extends SelectProfileImage {
  @override
  final ImageSource imageSource;

  factory _$SelectProfileImage([
    void Function(SelectProfileImageBuilder)? updates,
  ]) => (SelectProfileImageBuilder()..update(updates))._build();

  _$SelectProfileImage._({required this.imageSource}) : super._();
  @override
  SelectProfileImage rebuild(
    void Function(SelectProfileImageBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  SelectProfileImageBuilder toBuilder() =>
      SelectProfileImageBuilder()..replace(this);

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
    return (newBuiltValueToStringHelper(
      r'SelectProfileImage',
    )..add('imageSource', imageSource)).toString();
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
        _$SelectProfileImage._(
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
  ]) => (UpdateProfileDataBuilder()..update(updates))._build();

  _$UpdateProfileData._() : super._();
  @override
  UpdateProfileData rebuild(void Function(UpdateProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateProfileDataBuilder toBuilder() =>
      UpdateProfileDataBuilder()..replace(this);

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
    _$v = other as _$UpdateProfileData;
  }

  @override
  void update(void Function(UpdateProfileDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProfileData build() => _build();

  _$UpdateProfileData _build() {
    final _$result = _$v ?? _$UpdateProfileData._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

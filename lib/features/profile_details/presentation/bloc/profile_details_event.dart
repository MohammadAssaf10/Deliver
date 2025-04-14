import 'package:built_value/built_value.dart';
import 'package:image_picker/image_picker.dart';

import '../../../profile/domain/entities/profile.dart';

part 'profile_details_event.g.dart';

abstract class ProfileDetailsEvent {}

abstract class SetProfileData extends ProfileDetailsEvent
    implements Built<SetProfileData, SetProfileDataBuilder> {
  Profile get profile;

  SetProfileData._();

  factory SetProfileData([void Function(SetProfileDataBuilder) updates]) =
      _$SetProfileData;
}

abstract class SelectProfileImage extends ProfileDetailsEvent
    implements Built<SelectProfileImage, SelectProfileImageBuilder> {
  ImageSource get imageSource;

  SelectProfileImage._();

  factory SelectProfileImage(
          [void Function(SelectProfileImageBuilder) updates]) =
      _$SelectProfileImage;
}

abstract class UpdateProfileData extends ProfileDetailsEvent
    implements Built<UpdateProfileData, UpdateProfileDataBuilder> {
  UpdateProfileData._();

  factory UpdateProfileData([void Function(UpdateProfileDataBuilder) updates]) =
      _$UpdateProfileData;
}

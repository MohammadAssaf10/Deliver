import 'package:built_value/built_value.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_details_state.g.dart';

abstract class ProfileDetailsState
    implements Built<ProfileDetailsState, ProfileDetailsStateBuilder> {
  bool get isLoading;

  XFile? get profileImageFile;

  String get profileImage;

  ProfileDetailsState._();

  factory ProfileDetailsState(
          [void Function(ProfileDetailsStateBuilder) updates]) =
      _$ProfileDetailsState;

  factory ProfileDetailsState.initial() => ProfileDetailsState(
        (b) => b
          ..isLoading = false
          ..profileImageFile = null
          ..profileImage = '',
      );
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pinput/pinput.dart';

import '../../../profile/domain/entities/profile.dart';
import '../../data/repositories/profile_details_repository.dart';
import 'profile_details_event.dart';
import 'profile_details_state.dart';

@injectable
class ProfileDetailsBloc
    extends Bloc<ProfileDetailsEvent, ProfileDetailsState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ProfileDetailsRepository _profileDetailsRepository;
  final ImagePicker _imagePicker;

  void selectProfileImage(ImageSource imageSource) =>
      add(SelectProfileImage((b) => b..imageSource = imageSource));

  void setProfileData(Profile profile) =>
      add(SetProfileData((b) => b..profile = profile));

  void updateProfileData() => add(UpdateProfileData());

  ProfileDetailsBloc(
    this._imagePicker,
    this._profileDetailsRepository,
  ) : super(ProfileDetailsState.initial()) {
    on<SetProfileData>((event, emit) {
      usernameController.setText(event.profile.name);
      mobileNumberController.setText(event.profile.phone);
      if (event.profile.profileImage != null) {
        emit(
            state.rebuild((b) => b..profileImage = event.profile.profileImage));
      }
    });
    on<SelectProfileImage>((event, emit) async {
      final XFile? profileImageFile =
          await _imagePicker.pickImage(source: event.imageSource);
      if (profileImageFile != null) {
        emit(state.rebuild(
          (b) => b
            ..profileImageFile = profileImageFile
            ..profileImage = '',
        ));
      }
    });
    on<UpdateProfileData>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      final result = await _profileDetailsRepository.updateProfileDetails(
        profileImageFile: state.profileImageFile,
        profileImage: state.profileImage,
        username: usernameController.text,
        mobileNumber: mobileNumberController.text,
      );
      result.fold((failure) {
        emit(state.rebuild((b) => b..isLoading = false));
      }, (_) {
        emit(state.rebuild((b) => b..isLoading = false));
      });
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pinput/pinput.dart';

import '../../../../app/presentation/cubit/app_cubit.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../profile/data/models/profile.dart';
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

  void setProfileData() => add(SetProfileData());

  void updateProfileData() => add(UpdateProfileData());

  ProfileDetailsBloc(this._imagePicker, this._profileDetailsRepository)
    : super(ProfileDetailsState.initial()) {
    on<SetProfileData>((event, emit) {
      final Profile? profile = getIt<AppCubit>().state.profile;
      if (profile == null) return;
      usernameController.setText(profile.name);
      mobileNumberController.setText(profile.phone);
      if (profile.profileImage != null) {
        emit(state.rebuild((b) => b..profileImage = profile.profileImage));
      }
    });
    on<SelectProfileImage>((event, emit) async {
      final XFile? profileImageFile = await _imagePicker.pickImage(
        source: event.imageSource,
      );
      if (profileImageFile != null) {
        emit(
          state.rebuild(
            (b) => b
              ..profileImageFile = profileImageFile
              ..profileImage = '',
          ),
        );
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
      result.fold(
        (failure) {
          showToastMessage(failure.errorMessage, isError: true);
          emit(state.rebuild((b) => b..isLoading = false));
        },
        (message) {
          getIt<AppCubit>().getProfile();
          showToastMessage(message);
          emit(state.rebuild((b) => b..isLoading = false));
        },
      );
    });
  }
}

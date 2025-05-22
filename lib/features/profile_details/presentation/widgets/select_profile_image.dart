import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_extensions.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_dialogs.dart';
import '../../../../core/widget/custom_app_image.dart';
import '../bloc/profile_details_bloc.dart';
import '../bloc/profile_details_state.dart';

class SelectProfileImage extends StatelessWidget {
  const SelectProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDetailsBloc, ProfileDetailsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showImageSourceDialog(context, (imageSource) {
              context
                  .read<ProfileDetailsBloc>()
                  .selectProfileImage(imageSource);
            });
          },
          child: Stack(
            children: [
              if (state.profileImage.nullOrEmpty())
                Container(
                  height: 120,
                  width: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorsManager.grey),
                    image: state.profileImageFile != null
                        ? DecorationImage(
                            image:
                                FileImage(File(state.profileImageFile!.path)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: state.profileImageFile == null
                      ? const Icon(
                          Icons.person,
                          size: 90,
                          color: ColorsManager.lightGrey,
                        )
                      : null,
                ),
              if (!state.profileImage.nullOrEmpty())
                Container(
                  height: 120,
                  width: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: CustomAppImage(
                    image: state.profileImage,
                    height: 120,
                    width: 120,
                    boxShape: BoxShape.circle,
                    borderRadius: null,
                  ),
                ),
              PositionedDirectional(
                bottom: 0,
                end: 10,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.lightGrey,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: ColorsManager.darkGrey,
                    size: 21,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

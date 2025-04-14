import 'package:deliver/core/widget/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_functions.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/default_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../bloc/profile_details_bloc.dart';
import '../bloc/profile_details_state.dart';
import '../widgets/select_profile_image.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: S.of(context).profileDetails),
      body: BlocListener<ProfileDetailsBloc, ProfileDetailsState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoadingDialog(context);
          } else {
            closeLoadingDialogIfVisible();
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: context.read<ProfileDetailsBloc>().formKey,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Center(child: SelectProfileImage()),
                  SizedBox(height: 25),
                  CustomTextField(
                    controller:
                        context.read<ProfileDetailsBloc>().usernameController,
                    hintText: S.of(context).userName,
                    validator: AppValidator.usernameValidator,
                    prefixIcon: Icons.person,
                    textInputAction: TextInputAction.next,
                    fillColor: ColorsManager.lightGrey,
                  ),
                  CustomTextField(
                    controller: context
                        .read<ProfileDetailsBloc>()
                        .mobileNumberController,
                    hintText: S.of(context).mobileNumber,
                    validator: AppValidator.mobileNumberValidator,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    textInputFormatter: LengthLimitingTextInputFormatter(10),
                    fillColor: ColorsManager.lightGrey,
                  ),
                  AppTextButton(
                    onPressed: () {
                      if (context
                          .read<ProfileDetailsBloc>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<ProfileDetailsBloc>().updateProfileData();
                      }
                    },
                    outerPadding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: ColorsManager.lightGrey,
                    child: Text(
                      S.of(context).confirm,
                      style: TextStyles.font16DarkGreyMedium,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

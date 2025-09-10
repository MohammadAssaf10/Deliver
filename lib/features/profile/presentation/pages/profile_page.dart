import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/cubit/app_cubit.dart';
import '../../../../app/presentation/cubit/app_state.dart';
import '../../../../core/di/di.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/loader.dart';
import '../../../../generated/l10n.dart';
import '../widgets/logout_dialog.dart';
import '../widgets/profile_button.dart';
import '../widgets/profile_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppState appState = context.read<AppCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: appState.profileStatus.isLoading
          ? const Center(child: Loader(color: ColorsManager.darkWhite))
          : appState.profileStatus.isSuccess && appState.profile != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ProfileCard(profile: appState.profile!),
                  const SizedBox(height: 100),
                  ProfileButton(
                    onPressed: () {
                      context.pushNamed(Routes.profileDetailsPage);
                    },
                    title: S.of(context).profileDetails,
                  ),
                  ProfileButton(
                    onPressed: () {
                      context.pushNamedAndRemoveUntil(
                        Routes.splashPage,
                        predicate: (_) => false,
                      );
                      getIt<AppCubit>().changeAppLanguage();
                    },
                    title: S.of(context).changeLanguage,
                  ),
                  ProfileButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => const LogoutDialog(),
                      );
                    },
                    title: S.of(context).logout,
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

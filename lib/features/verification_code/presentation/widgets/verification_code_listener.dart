import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_functions.dart';
import '../bloc/verification_code_bloc.dart';
import '../bloc/verification_code_state.dart';

class VerificationCodeListener extends StatelessWidget {
  const VerificationCodeListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCodeBloc, VerificationCodeState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.mainPage,
            predicate: (_) => false,
          );
        }
        if (state.isLoading) {
          showLoadingDialog(context);
        }
        if (state.isError) {
          closeLoadingDialogIfVisible();
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

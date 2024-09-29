import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/presentation/bloc/app_cubit.dart';
import 'app/presentation/deliver_app.dart';
import 'core/di/di.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
    BlocProvider<AppCubit>(
      create: (_) => getIt<AppCubit>()..getAppLanguage(),
      child: DeliverApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

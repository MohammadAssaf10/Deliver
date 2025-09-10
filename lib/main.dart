import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/presentation/cubit/app_cubit.dart';
import 'app/presentation/deliver_app.dart';
import 'core/di/di.dart';
import 'core/routing/app_router.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/notifications_helper.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  Bloc.observer = MyBlocObserver();
  NotificationsHelper.init();
  runApp(
    BlocProvider<AppCubit>(
      create: (_) => getIt<AppCubit>()..getAppLanguage(),
      child: DeliverApp(appRouter: AppRouter()),
    ),
  );
  // await dotenv.load(fileName: Assets.deliver);
  // final String? sentryDsn = dotenv.env['SENTRY_DSN'];
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = sentryDsn;
  //     options.tracesSampleRate = 1.0;
  //     options.profilesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(
  //     BlocProvider<AppCubit>(
  //       create: (_) => getIt<AppCubit>()..getAppLanguage(),
  //       child: DeliverApp(
  //         appRouter: AppRouter(),
  //       ),
  //     ),
  //   ),
  // );
}

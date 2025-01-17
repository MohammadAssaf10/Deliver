import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/presentation/bloc/app_cubit.dart';
import 'app/presentation/deliver_app.dart';
import 'core/di/di.dart';
import 'core/routing/app_router.dart';
import 'core/utils/app_functions.dart';
import 'core/utils/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  Bloc.observer = MyBlocObserver();
  final String sentryDsn = await getSentryDsn();
  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDsn;
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      BlocProvider<AppCubit>(
        create: (_) => getIt<AppCubit>()..getAppLanguage(),
        child: DeliverApp(
          appRouter: AppRouter(),
        ),
      ),
    ),
  );
}

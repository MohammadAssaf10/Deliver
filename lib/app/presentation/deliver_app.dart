import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../core/routing/app_router.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors_manager.dart';
import '../../generated/l10n.dart';
import 'bloc/app_cubit.dart';
import 'bloc/app_state.dart';

class DeliverApp extends StatelessWidget {
  final AppRouter appRouter;

  const DeliverApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Deliver',
          initialRoute: Routes.signInPage,
          onGenerateRoute: appRouter.generateRoute,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(state.appLanguage.name),
          theme: ThemeData(
            scaffoldBackgroundColor: ColorsManager.backgroundColor,
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: ColorsManager.grey.withOpacity(0.5),
              selectionHandleColor: ColorsManager.black,
            ),
          ),
        );
      },
    );
  }
}

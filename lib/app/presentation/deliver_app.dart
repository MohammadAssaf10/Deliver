import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../core/routing/route_observer_helper.dart';
import '../../core/routing/app_router.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors_manager.dart';
import '../../generated/l10n.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';

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
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: child!,
            );
          },
          initialRoute: Routes.splashPage,
          onGenerateRoute: appRouter.generateRoute,
          navigatorObservers: <NavigatorObserver>[
            RouteObserverHelper.mainRouteObserver,
          ],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(state.appLanguage.name),
          theme: ThemeData(
            scaffoldBackgroundColor: ColorsManager.darkGrey,
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorsManager.darkGrey,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: ColorsManager.darkGrey,
            ),
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: ColorsManager.grey.withValues(alpha: 0.5),
              selectionHandleColor: ColorsManager.darkGrey,
            ),
          ),
        );
      },
    );
  }
}

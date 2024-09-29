import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/main/presentation/pages/main_page.dart';
import '../../features/maps/presentation/bloc/map_bloc.dart';
import '../../features/maps/presentation/pages/map_page.dart';
import '../../features/on_boarding/presentation/pages/on_boarding_page.dart';
import '../../features/sign_in/presentation/bloc/sign_in_bloc.dart';
import '../../features/sign_in/presentation/pages/sign_in_page.dart';
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart';
import '../../features/sign_up/presentation/pages/sign_up_page.dart';
import '../di/di.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.mainPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MapBloc>(
            create: (_) => getIt<MapBloc>(),
            child: const MainPage(),
          ),
        );
      case Routes.signInPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignInBloc>(
            create: (context) => getIt<SignInBloc>(),
            child: const SignInPage(),
          ),
        );
      case Routes.signUpPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpBloc>(
            create: (context) => getIt<SignUpBloc>(),
            child: const SignUpPage(),
          ),
        );
      case Routes.mapPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<MapBloc>(
            create: (_) => getIt<MapBloc>(),
            child: const MapPage(),
          ),
        );
      case Routes.onBoardingPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
        );
      default:
        return null;
    }
  }
}

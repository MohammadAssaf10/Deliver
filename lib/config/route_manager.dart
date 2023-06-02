import 'package:go_router/go_router.dart';

import '../features/login/presentation/pages/login_page.dart';
import '../features/register/presentation/pages/register_page.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'login',
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);

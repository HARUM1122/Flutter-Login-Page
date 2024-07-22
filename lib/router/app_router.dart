import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/siginin_page.dart';
import '../features/auth/presentation/screens/signup_page.dart';
final GoRouter appRouter = GoRouter(
  initialLocation: '/signup-page',
  routes: [
    GoRoute(
      path: '/signin-page',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/signup-page',
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);

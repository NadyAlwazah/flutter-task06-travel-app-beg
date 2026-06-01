import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/signin_view.dart';
import 'package:flutter_task06_travel_app_beg/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSignin = '/signin';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kSignin, builder: (context, state) => const SigninView()),
    ],
  );
}

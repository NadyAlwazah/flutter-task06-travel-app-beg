import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/signin_view.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/signup_view.dart';
import 'package:flutter_task06_travel_app_beg/features/bottom_bar_layout/presentation/views/bottom_bar_layout.dart';
import 'package:flutter_task06_travel_app_beg/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSignin = '/signin';
  static const String kSignup = '/signup';
  static const String kBottomBar = '/bottom_bar';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kSignin, builder: (context, state) => const SigninView()),
      GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
      GoRoute(
        path: kBottomBar,
        builder: (context, state) => const BottomBarLayout(),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/app/routes.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    initAuthCheck();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoaded || current is AuthInitial,
      listener: (context, state) {
        if (state is AuthLoaded) {
          context.go(AppRouter.kBottomBar);
        } else if (state is AuthInitial) {
          context.go(AppRouter.kSignin);
        }
      },
      child: Container(
        color: AppColors.primary,
        child: Center(child: Image.asset(AssetsData.splashImage)),
      ),
    );
  }

  void initAuthCheck() async {
    final cubit = context.read<AuthCubit>();

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    cubit.checkAuth();
  }
}

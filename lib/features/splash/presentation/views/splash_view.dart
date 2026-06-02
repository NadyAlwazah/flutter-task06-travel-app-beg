import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';
import 'package:flutter_task06_travel_app_beg/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primary),
      body: const SplashViewBody(),
    );
  }
}

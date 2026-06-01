import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Center(
        child: Text(
          "Travenor",
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

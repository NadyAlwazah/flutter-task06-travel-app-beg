import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';

abstract class Styles {
  static TextStyle appBarTitle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 17,
  );
  static TextStyle titleHeader = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle authLink = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 17,
  );
}

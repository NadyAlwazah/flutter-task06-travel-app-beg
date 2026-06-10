import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    required String message,
    bool isError = true,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) : super(
         backgroundColor: isError ? Colors.red : Colors.green,
         behavior: behavior,
         content: Text(message, style: const TextStyle(color: Colors.white)),
       );
}

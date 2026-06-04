import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: isLoading
          ? const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CupertinoActivityIndicator(),
              ),
            )
          : Text(text!, style: Styles.buttonText),
    );
  }
}

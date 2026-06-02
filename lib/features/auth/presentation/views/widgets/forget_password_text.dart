import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/styles.dart';

class ForgetPasswordText extends StatelessWidget {
  final VoidCallback? onTap;

  const ForgetPasswordText({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: onTap,
        child: const Text("Forget Password?", style: Styles.authLink),
      ),
    );
  }
}

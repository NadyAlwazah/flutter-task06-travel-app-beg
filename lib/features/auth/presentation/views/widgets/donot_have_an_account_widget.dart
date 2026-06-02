import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class DonotHaveAnAccountWidget extends StatelessWidget {
  final VoidCallback? onSignupTap;

  const DonotHaveAnAccountWidget({super.key, this.onSignupTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: onSignupTap,
          child: const Text("Sign up", style: Styles.authAction),
        ),
      ],
    );
  }
}

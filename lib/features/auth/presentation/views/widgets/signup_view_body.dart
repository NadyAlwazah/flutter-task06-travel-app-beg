import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/auth_header.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const AuthHeader(
              title: 'Sign up now',
              subtitle: 'Please fill the details and create account',
            ),
          ],
        ),
      ),
    );
  }
}

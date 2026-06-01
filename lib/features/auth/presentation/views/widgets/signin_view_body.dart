import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/auth_header.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              title: 'Sign in now',
              subtitle: 'Please sign in to continue our app',
            ),
          ],
        ),
      ),
    );
  }
}

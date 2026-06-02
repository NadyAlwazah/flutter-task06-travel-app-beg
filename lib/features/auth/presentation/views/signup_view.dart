import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SignupViewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/forget_password_text.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: const Column(
            children: [
              SizedBox(height: 32),
              AuthHeader(
                title: 'Sign in now',
                subtitle: 'Please sign in to continue our app',
              ),

              SizedBox(height: 32),
              CustomTextFormField(
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
              ),

              SizedBox(height: 24),
              CustomTextFormField(
                hintText: "Password ",
                textInputType: TextInputType.text,
                obscureText: true,
              ),

              SizedBox(height: 5),
              ForgetPasswordText(),
            ],
          ),
        ),
      ),
    );
  }
}

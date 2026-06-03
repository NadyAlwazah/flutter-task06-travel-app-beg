import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/validators.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/donot_have_an_account_widget.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/forget_password_text.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/social_icons_row.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const AuthHeader(
                title: 'Sign in now',
                subtitle: 'Please sign in to continue our app',
              ),

              const SizedBox(height: 32),
              CustomTextFormField(
                controller: emailController,
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
              ),

              const SizedBox(height: 24),
              CustomTextFormField(
                controller: passwordController,
                hintText: "Password ",
                textInputType: TextInputType.text,
                obscureText: true,
                validator: Validators.validatePassword,
              ),

              const SizedBox(height: 5),
              const ForgetPasswordText(),

              const SizedBox(height: 32),
              CustomButton(text: "Sign In", onPressed: () {}),

              const SizedBox(height: 32),
              const DonotHaveAnAccountWidget(),

              const SizedBox(height: 16),
              const Text("Or connect", style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 130),
              const SocialIconsRow(),
            ],
          ),
        ),
      ),
    );
  }
}

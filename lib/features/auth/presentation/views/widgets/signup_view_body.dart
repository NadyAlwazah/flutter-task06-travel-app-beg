import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/validators.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const AuthHeader(
                title: 'Sign up now',
                subtitle: 'Please fill the details and create account',
              ),

              const SizedBox(height: 32),
              CustomTextFormField(
                controller: fullNameController,
                hintText: "Full Name",
                textInputType: TextInputType.text,
                validator: Validators.validateFullName,
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
            ],
          ),
        ),
      ),
    );
  }
}

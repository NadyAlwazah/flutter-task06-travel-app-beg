import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/app/routes.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/validators.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/donot_have_an_account_widget.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/forget_password_text.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/social_icons_row.dart';
import 'package:go_router/go_router.dart';

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
    final cubit = context.read<AuthCubit>();
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
              BlocConsumer<AuthCubit, AuthState>(
                bloc: cubit,
                listenWhen: (previous, current) =>
                    current is AuthLoaded || current is AuthError,
                listener: (context, state) {
                  if (state is AuthLoaded) {
                    context.go(AppRouter.kBottomBar);
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(message: state.message, isError: true),
                    );
                  }
                },
                buildWhen: (previous, current) =>
                    current is AuthLoading || current is AuthError,
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CustomButton(isLoading: true);
                  }
                  return CustomButton(
                    text: "Sign In",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await cubit.loginWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                  );
                },
              ),

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

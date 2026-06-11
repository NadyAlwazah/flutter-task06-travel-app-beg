import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/app/routes.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/validators.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/presentation/views/widgets/social_icons_row.dart';
import 'package:go_router/go_router.dart';

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
    final cubit = context.read<AuthCubit>();
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
              const SizedBox(height: 24),
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

              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password must be 8 charactar",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 40),
              BlocConsumer<AuthCubit, AuthState>(
                bloc: cubit,
                listenWhen: (previous, current) =>
                    current is AuthLoaded || current is AuthError,

                listener: (context, state) {
                  if (state is AuthLoaded) {
                    //!
                    context.go(AppRouter.kBottomBar);
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(message: state.message, isError: true),
                    );
                  }
                },
                buildWhen: (previous, current) =>
                    current is AuthLoading ||
                    current is AuthError ||
                    current is AuthLoaded,
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CustomButton(isLoading: true);
                  }
                  return CustomButton(
                    text: "Sign Up",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await cubit.registerWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                          fullNameController.text,
                        );
                      }
                    },
                  );
                },
              ),

              const SizedBox(height: 32),
              const HaveAnAccountWidget(),

              const SizedBox(height: 16),
              const Text("Or connect", style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 42),
              const SocialIconsRow(),
            ],
          ),
        ),
      ),
    );
  }
}

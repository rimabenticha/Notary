import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_password_text_field.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';
import 'package:noteary/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthFailure) {
          Navigator.pop(context);
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        } else if (state is Authenticated) {
          Navigator.pop(context);
          context.go(AppRouter.kNavigationMenu);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              textController: _fullNameController,
              label: 'Full name',
              hintText: 'Enter your first name',
              warningText: 'Please enter your first name!',
            ),
            const SizedBox(height: 15),

            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              textController: _emailController,
              label: 'Email',
              hintText: 'Enter your email',
              warningText: 'Enter your email!',
            ),
            const SizedBox(height: 15),

            CustomPasswordTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password!';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long!';
                }
                return null;
              },
              textController: _passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              warningText: 'Please enter your password!',
            ),
            const SizedBox(height: 15),

            CustomPasswordTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password!';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match!';
                }
                return null;
              },
              textController: _confirmPasswordController,
              label: 'Confirm password',
              hintText: 'Enter your password',
              warningText: ' Please confirm  your password!',
            ),

            const SizedBox(height: 20),

            CustomElevatedButton(
              label: 'Sign up',
              onPressed: () async {
                final bool isValid = _formKey.currentState!.validate();
                if (isValid &&
                    _passwordController.text ==
                        _confirmPasswordController.text) {
                  log("Nom: ${_fullNameController.text}");
                  log("Email: ${_emailController.text}");
                  log("Mot de passe: ${_passwordController.text}");
                  await context.read<AuthCubit>().signUp(
                    fullName: _fullNameController.text.trim(),
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

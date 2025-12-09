import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_password_text_field.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';

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
    return Form(
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
            textController: _emailController,
            label: 'Email',
            hintText: 'Enter your email',
            warningText: 'Enter your email!',
          ),
          const SizedBox(height: 15),

          CustomPasswordTextField(
            textController: _passwordController,
            label: 'Password',
            hintText: 'Enter your password',
            warningText: 'Please enter your password!',
          ),
          const SizedBox(height: 15),

          CustomPasswordTextField(
            textController: _confirmPasswordController,
            label: 'Confirm password',
            hintText: 'Enter your password',
            warningText: ' Please confirm  your password!',
          ),
          const SizedBox(height: 20),

          CustomElevatedButton(
            label: 'Sign up',
            onPressed: () {
              final bool isValid = _formKey.currentState!.validate();
              if (isValid) {
                log("Nom: ${_fullNameController.text}");
                log("Email: ${_emailController.text}");
                log("Mot de passe: ${_passwordController.text}");
                context.go(AppRouter.kNavigationMenu);
                // TODO: add signup method
                // context.read<AuthCubit>().signup(
                //   nom: _nomController.text.trim(),
                //   prenom: _prenomController.text.trim(),
                //   email: _emailController.text.trim(),
                //   password: _passwordController.text.trim(),
                // );
              }
            },
          ),
        ],
      ),
    );
  }
}

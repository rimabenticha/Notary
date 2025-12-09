import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_password_text_field.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            textController: _emailController,
            label: 'Email',
            hintText: 'Enter your email',
            warningText: 'Please enter your email!',
          ),
          const SizedBox(height: 15),
          CustomPasswordTextField(
            textController: _passwordController,
            label: 'Password',
            hintText: 'Enter your password',
            warningText: 'Please enter your password!',
          ),

          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Forgot password?', style: Styles.textStyle16),
            ),
          ),

          const SizedBox(height: 6),

          CustomElevatedButton(
            label: 'Sign in',
            onPressed: () async {
              final bool isValid = _formKey.currentState!.validate();
              if (isValid) {
                context.go(AppRouter.kNavigationMenu);
              }
            },
          ),
        ],
      ),
    );
  }
}

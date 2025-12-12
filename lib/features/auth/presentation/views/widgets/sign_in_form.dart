import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_password_text_field.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';
import 'package:noteary/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthFailure) {
          context.pop();
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        } else if (state is Authenticated) {
          context.pop();
          context.go(AppRouter.kNavigationMenu);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              textController: _emailController,
              label: 'Email',
              hintText: 'Enter your email',
              warningText: 'Please enter your email!',
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
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
                child: const Text(
                  'Forgot password?',
                  style: Styles.textStyle16,
                ),
              ),
            ),

            const SizedBox(height: 6),

            CustomElevatedButton(
              label: 'Sign in',
              onPressed: () async {
                final bool isValid = _formKey.currentState!.validate();
                if (isValid) {
                  await context.read<AuthCubit>().signIn(
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

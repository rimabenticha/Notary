import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';
import 'package:noteary/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class ForgotPasswordScreenBody extends StatefulWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  State<ForgotPasswordScreenBody> createState() =>
      _ForgotPasswordScreenBodyState();
}

class _ForgotPasswordScreenBodyState extends State<ForgotPasswordScreenBody> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ResetPasswordSuccess) {
          context.pop();
          context.pop();
          customSnackBar(
            context: context,
            message: 'Password reset email sent successfully!',
            success: true,
          );
        } else if (state is ResetPasswordFailure) {
          context.pop();
          customSnackBar(
            context: context,
            message: state.errMessage,
            success: false,
          );
        }
      },
      child: SingleChildScrollView(
        padding: kPadd16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your email to reset your password',
              style: Styles.textStyle16,
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    CustomTextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      textController: emailController,
                      label: 'Email',
                      hintText: 'Email',
                      warningText: 'Please enter your email!',
                    ),

                    const SizedBox(height: 20),

                    CustomElevatedButton(
                      label: 'Reset password',
                      onPressed: () {
                        final bool isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          context.read<AuthCubit>().resetPassword(
                            email: emailController.text.trim(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

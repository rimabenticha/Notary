import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/widgets/custom_elevated_button.dart';
import 'package:noteary/core/widgets/custom_text_form_field.dart';

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
    return SingleChildScrollView(
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
                        // context.read<AuthCubit>().resetPassword(
                        //   email: emailController.text.trim(),
                        // );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

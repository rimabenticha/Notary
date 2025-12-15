import 'package:flutter/material.dart';
import 'package:noteary/features/auth/presentation/views/widgets/forgot_password_screen_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const ForgotPasswordScreenBody(),
    );
  }
}

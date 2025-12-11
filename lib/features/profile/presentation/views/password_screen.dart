import 'package:flutter/material.dart';
import 'package:noteary/features/profile/presentation/views/widgets/password_screen_body.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password')),
      body: const PasswordScreenBody(),
    );
  }
}
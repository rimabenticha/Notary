import 'package:flutter/material.dart';
import 'package:noteary/features/profile/presentation/views/widgets/privacy_policy_screen_body.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: const PrivacyPolicyScreenBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:noteary/features/profile/presentation/views/widgets/faq_screen_body.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQ')),
      body: const FaqScreenBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:noteary/features/profile/presentation/views/widgets/contact_us_screen_body.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: const ContactUsScreenBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/profile/presentation/views/widgets/contact_us_form.dart';

class ContactUsScreenBody extends StatelessWidget {
  const ContactUsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: kPadd16,
      child: ContactUsForm(),
    );
  }
}

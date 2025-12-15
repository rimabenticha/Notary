import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/features/profile/presentation/views/widgets/password_form.dart';

class PasswordScreenBody extends StatelessWidget {
  const PasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPadd16,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'The new password must be different from the current password and must be at least 8 characters long.',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),
          const PasswordForm(),
        ],
      ),
    );
  }
}

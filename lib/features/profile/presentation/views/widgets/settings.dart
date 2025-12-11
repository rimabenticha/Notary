import 'package:flutter/material.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/features/profile/presentation/views/widgets/settings_button.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        SettingsButton(
          icon: const Icon(
            Icons.person_outline,
            color: MyColors.yellow,
            size: 25,
          ),
          text: 'Personal Information',
          onPressed: () {
            // context.push(AppRouter.kPersonalInfoScreen, extra: user);
          },
        ),
        SettingsButton(
          icon: const Icon(
            Icons.lock_outline,
            color: MyColors.yellow,
            size: 25,
          ),
          text: 'Password',
          onPressed: () {
            // context.push(AppRouter.kChangePasswordScreen);
          },
        ),
        const SizedBox(height: 10),
        SettingsButton(
          icon: const Icon(
            Icons.shield_outlined,
            color: MyColors.yellow,
            size: 25,
          ),
          text: 'Privacy Policy',
          onPressed: () {
            // context.push(AppRouter.kPrivacyPolicyScreen);
          },
        ),
        SettingsButton(
          icon: const Icon(
            Icons.question_mark,
            color: MyColors.yellow,
            size: 25,
          ),
          text: 'FAQ',
          onPressed: () {
            // context.push(AppRouter.kFAQScreen);
          },
        ),
        SettingsButton(
          icon: const Icon(
            Icons.email_outlined,
            color: MyColors.yellow,
            size: 25,
          ),
          text: 'Contact Us',
          onPressed: () {
            // context.push(AppRouter.kContactUsScreen);
          },
        ),
      ],
    );
  }
}

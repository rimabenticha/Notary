import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/features/profile/presentation/manager/update_personal_data_cubit/update_personal_data_cubit.dart';
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
            color: MyColors.pruple,
            size: 25,
          ),
          text: 'Personal Data',
          onPressed: () {
            final updatePersonalDataCubit = context
                .read<UpdatePersonalDataCubit>();
            context.push(
              AppRouter.kPersonalDataScreen,
              extra: updatePersonalDataCubit,
            );
          },
        ),
        SettingsButton(
          icon: const Icon(
            Icons.lock_outline,
            color: MyColors.pruple,
            size: 25,
          ),
          text: 'Password',
          onPressed: () {
            context.push(AppRouter.kPasswordScreen);
          },
        ),
        const SizedBox(height: 10),
        SettingsButton(
          icon: const Icon(
            Icons.shield_outlined,
            color: MyColors.pruple,
            size: 25,
          ),
          text: 'Privacy Policy',
          onPressed: () {
            context.push(AppRouter.kPrivacyPolicyScreen);
          },
        ),
        SettingsButton(
          icon: const Icon(
            Icons.question_mark,
            color: MyColors.pruple,
            size: 25,
          ),
          text: 'FAQ',
          onPressed: () {
            context.push(AppRouter.kFaqScreen);
          },
        ),
        SettingsButton(
          icon: const Icon(
            Icons.email_outlined,
            color: MyColors.pruple,
            size: 25,
          ),
          text: 'Contact Us',
          onPressed: () {
            context.push(AppRouter.kContactUsScreen);
          },
        ),
      ],
    );
  }
}

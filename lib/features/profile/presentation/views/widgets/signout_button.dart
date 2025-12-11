import 'package:flutter/material.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';

class SignoutButton extends StatelessWidget {
  const SignoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // context.read<AuthCubit>().signout();
      },
      style: TextButton.styleFrom(padding: kPadd8),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: MyColors.blue,
              shape: BoxShape.circle,
            ),
            width: 40,
            height: 40,
            child: const Icon(Icons.logout, color: MyColors.yellow, size: 25),
          ),
          const SizedBox(width: 15),
          Text(
            'Sign out',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
              color: MyColors.black.withValues(alpha: .8),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: MyColors.black.withValues(alpha: .8),
          ),
        ],
      ),
    );
  }
}

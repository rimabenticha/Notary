import 'package:flutter/material.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final Icon icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: kPadd8,
        shape: RoundedRectangleBorder(borderRadius: kRadius10),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: MyColors.blue,
              shape: BoxShape.circle,
            ),
            width: 40,
            height: 40,
            child: icon,
          ),
          const SizedBox(width: 15),
          Text(
            text,
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

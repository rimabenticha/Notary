import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/assets.dart';
import 'package:noteary/core/utils/service_locator.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: MyColors.grey,
          foregroundImage: AssetImage(AssetsData.defaultAvatar),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            Text(
              getIt.get<FirebaseAuth>().currentUser?.displayName ?? '',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(getIt.get<FirebaseAuth>().currentUser?.email ?? ''),
          ],
        ),
      ],
    );
  }
}

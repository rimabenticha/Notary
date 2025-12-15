import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/assets.dart';
import 'package:noteary/core/utils/service_locator.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: MyColors.grey,
            foregroundImage: AssetImage(AssetsData.defaultAvatar),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: Styles.textStyle16,
                  children: [
                    const TextSpan(
                      text: 'Hello, ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text:
                          getIt.get<FirebaseAuth>().currentUser?.displayName ??
                          'New User',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.pruple,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Hope you\'re doing well today!',
                style: Styles.textStyle14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

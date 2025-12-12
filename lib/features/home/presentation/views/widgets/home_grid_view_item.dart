import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/app_router.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRouter.kNoteConentScreen),
      child: Card(
        child: Padding(
          padding: kPadd8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'title',
                style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                'ihjftiocjcvtkoikkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkmmmmmmmmmmmmmmmmmmmmmmmmhhhhhhhhhhhhhhhhhhh',
                style: Styles.textStyle16.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

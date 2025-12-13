import 'package:flutter/material.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeGridViewItemSkeleton extends StatelessWidget {
  const HomeGridViewItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: MyColors.grey[350]!,
        highlightColor: MyColors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: kRadius10),
        child: const Padding(
          padding: kPadd8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title skeleton
              Bone.text(words: 2, fontSize: 20),
              SizedBox(height: 10),
              // Content skeleton (multiple lines)
              Bone.text(words: 8, fontSize: 16),
              SizedBox(height: 4),
              Bone.text(words: 6, fontSize: 16),
              SizedBox(height: 4),
              Bone.text(words: 6, fontSize: 16),
              SizedBox(height: 4),
              Bone.text(words: 6, fontSize: 16),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_grid_view_skeleton.dart';

class HomeGridViewLoading extends StatelessWidget {
  const HomeGridViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: kPadd16,
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const HomeGridViewItemSkeleton();
        },
      ),
    );
  }
}

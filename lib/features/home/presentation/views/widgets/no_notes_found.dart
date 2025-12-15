import 'package:flutter/material.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/assets.dart';

class NoNotesFound extends StatelessWidget {
  const NoNotesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(AssetsData.noNotesIllustration),
              width: 250,
            ),
            SizedBox(height: 10),
            Text('No notes found', style: Styles.textStyle16),
          ],
        ),
      ),
    );
  }
}

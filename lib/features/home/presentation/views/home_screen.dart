import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: HomeScreenBody()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRouter.kNewNoteScreen);
        },
        child: const Icon(Icons.add, size: 36),
      ),
    );
  }
}

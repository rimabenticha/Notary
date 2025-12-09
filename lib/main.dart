import 'package:flutter/material.dart';
import 'package:noteary/core/utils/app_router.dart';

void main() {
  runApp(const Noteary());
}

class Noteary extends StatelessWidget {
  const Noteary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

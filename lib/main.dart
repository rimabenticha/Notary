import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteary/core/utils/app_router.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

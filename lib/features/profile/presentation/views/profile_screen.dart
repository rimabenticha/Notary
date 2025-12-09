import 'package:flutter/material.dart';
import 'package:noteary/features/profile/presentation/views/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const ProfileScreenBody(),
    );
  }
}

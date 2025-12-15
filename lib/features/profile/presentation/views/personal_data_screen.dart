import 'package:flutter/material.dart';
import 'package:noteary/features/profile/presentation/views/widgets/personal_data_screen_body.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Data')),
      body: const PersonalDataScreenBody(),
    );
  }
}

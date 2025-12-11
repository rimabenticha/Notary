import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/profile/presentation/views/widgets/header_section.dart';
import 'package:noteary/features/profile/presentation/views/widgets/settings.dart';
import 'package:noteary/features/profile/presentation/views/widgets/signout_button.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPadd16,
      child: Center(
        child: Column(
          children: [
            HeaderSection(),
            SizedBox(height: 10),
            Settings(),
            SizedBox(height: 20),
            SignoutButton(),
          ],
        ),
      ),
    );
  }
}

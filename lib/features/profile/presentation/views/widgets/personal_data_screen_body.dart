import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/profile/presentation/views/widgets/personal_data_form.dart';

class PersonalDataScreenBody extends StatelessWidget {
  const PersonalDataScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: kPadd16,
      child: PersonalDataForm(),
    );
  }
}

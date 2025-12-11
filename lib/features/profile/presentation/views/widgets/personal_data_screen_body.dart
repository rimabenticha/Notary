import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/auth/data/models/user_model.dart';
import 'package:noteary/features/profile/presentation/views/widgets/personal_data_form.dart';

class PersonalDataScreenBody extends StatelessWidget {
  const PersonalDataScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPadd16,
      child: PersonalDataForm(
        user: UserModel(
          fullName: 'Rima',
          email: 'rima@gmail.com',
          photoURL: 'https://via.placeholder.com/150',
          userId: '1234567890',
        ),
      ),
    );
  }
}

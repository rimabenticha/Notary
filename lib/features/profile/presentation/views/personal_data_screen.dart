import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/profile/presentation/manager/update_personal_data_cubit/update_personal_data_cubit.dart';
import 'package:noteary/features/profile/presentation/views/widgets/personal_data_screen_body.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key, required this.updatePersonalDataCubit});

  final UpdatePersonalDataCubit updatePersonalDataCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: updatePersonalDataCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Personal Data')),
        body: const PersonalDataScreenBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/profile/data/repos/profile_repo_impl.dart';
import 'package:noteary/features/profile/presentation/manager/update_personal_data_cubit/update_personal_data_cubit.dart';
import 'package:noteary/features/profile/presentation/views/widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdatePersonalDataCubit(getIt.get<ProfileRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: const ProfileScreenBody(),
      ),
    );
  }
}

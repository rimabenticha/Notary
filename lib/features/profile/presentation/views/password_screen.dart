import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/profile/data/repos/profile_repo_impl.dart';
import 'package:noteary/features/profile/presentation/manager/update_password_cubit/update_password_cubit.dart';
import 'package:noteary/features/profile/presentation/views/widgets/password_screen_body.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(getIt.get<ProfileRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Password')),
        body: const PasswordScreenBody(),
      ),
    );
  }
}

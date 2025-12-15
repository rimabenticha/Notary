import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/profile/data/repos/profile_repo_impl.dart';
import 'package:noteary/features/profile/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:noteary/features/profile/presentation/views/widgets/contact_us_screen_body.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(getIt.get<ProfileRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Contact Us')),
        body: const ContactUsScreenBody(),
      ),
    );
  }
}

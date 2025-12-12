import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/utils/bloc_observer.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/auth/data/repos/auth_repo_impl.dart';
import 'package:noteary/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setup();

  Bloc.observer = SimpleBlocObserver();

  final AuthCubit authCubit = AuthCubit(getIt.get<AuthRepoImpl>());
  AppRouter.initialize(authCubit);

  runApp(Noteary(authCubit: authCubit));
}

class Noteary extends StatelessWidget {
  const Noteary({super.key, required this.authCubit});

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: authCubit)],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:noteary/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        body: LiquidPullToRefresh(
          showChildOpacityTransition: false,
          color: MyColors.lightBlue,
          animSpeedFactor: 3,
          springAnimationDurationInMilliseconds: 1000,
          onRefresh: () async => await context.read<GetNotesCubit>().getNotes(
            uid: getIt.get<FirebaseAuth>().currentUser!.uid,
          ),
          child: const SafeArea(child: HomeScreenBody()),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.yellow,
          onPressed: () {
            context.push(AppRouter.kNewNoteScreen);
          },
          child: const Icon(Icons.add, size: 36),
        ),
      ),
    );
  }
}

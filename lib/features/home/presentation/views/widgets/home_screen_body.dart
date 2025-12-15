import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_grid_view_bloc_builder.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_search_bar.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    context.read<GetNotesCubit>().getNotes(
      uid: getIt.get<FirebaseAuth>().currentUser!.uid,
    );
    log('HomeScreen', name: 'Refreshing');
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [HomeAppBar(), HomeSearchBar(), HomeGridViewBlocBuilder()],
    );
  }
}

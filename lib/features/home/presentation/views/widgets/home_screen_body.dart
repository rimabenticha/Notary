import 'package:flutter/material.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_grid_view.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_search_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [HomeAppBar(), HomeSearchBar(), HomeGridView()],
    );
  }
}

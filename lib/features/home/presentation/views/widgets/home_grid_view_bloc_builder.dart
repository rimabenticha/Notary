import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_grid_view.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_grid_view_loading.dart';

class HomeGridViewBlocBuilder extends StatelessWidget {
  const HomeGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesSuccess) {
          return HomeGridView(notes: state.notes);
        } else if (state is GetNotesFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return const HomeGridViewLoading();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_grid_view_item.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesSuccess) {
          return SliverPadding(
            padding: kPadd16,
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return HomeGridViewItem(note: state.notes[index], index: index);
              },
            ),
          );
        } else if (state is GetNotesFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

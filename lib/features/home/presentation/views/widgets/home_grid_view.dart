import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/home/presentation/views/widgets/home_grid_view_item.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key, required this.notes});

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: kPadd16,
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return HomeGridViewItem(note: notes[index], index: index);
        },
      ),
    );
  }
}

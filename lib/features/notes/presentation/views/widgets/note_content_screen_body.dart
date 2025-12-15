import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';

class NoteContentScreenBody extends StatelessWidget {
  const NoteContentScreenBody({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPadd16,
      child: Text(note.content!, style: Styles.textStyle20),
    );
  }
}

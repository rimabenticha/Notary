import 'package:flutter/material.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';
import 'package:noteary/features/notes/presentation/views/widgets/note_content_screen_body.dart';

class NoteContentScreen extends StatelessWidget {
  const NoteContentScreen({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title!),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: implement delete note
            },
            icon: const Icon(Icons.delete, color: Colors.red, size: 30),
          ),
        ],
      ),
      body: NoteContentScreenBody(note: note),
    );
  }
}

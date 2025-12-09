import 'package:flutter/material.dart';
import 'package:noteary/features/notes/presentation/views/widgets/note_content_screen_body.dart';

class NoteContentScreen extends StatelessWidget {
  const NoteContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ad Content')),
      body: const NoteContentScreenBody(),
    );
  }
}

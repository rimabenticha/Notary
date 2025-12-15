import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';
import 'package:noteary/features/notes/data/repos/notes_repo_impl.dart';
import 'package:noteary/features/notes/presentation/manager/delete_cubit/delete_note_cubit.dart';
import 'package:noteary/features/notes/presentation/views/widgets/note_content_screen_body.dart';

class NoteContentScreen extends StatelessWidget {
  const NoteContentScreen({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteNoteCubit(getIt.get<NotesRepoImpl>()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(note.title!),
              actions: [
                BlocListener<DeleteNoteCubit, DeleteNoteState>(
                  listener: (context, state) {
                    if (state is DeleteNoteLoading) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is DeleteNoteSuccess) {
                      context.pop();
                      context.pop();
                      customSnackBar(
                        context: context,
                        message: 'Note deleted successfully!',
                        success: true,
                      );
                    } else if (state is DeleteNoteFailure) {
                      context.pop();
                      customSnackBar(
                        context: context,
                        message: state.errMessage,
                        success: false,
                      );
                    }
                  },
                  child: IconButton(
                    onPressed: () {
                      context.read<DeleteNoteCubit>().deleteNote(id: note.id!);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red, size: 30),
                  ),
                ),
              ],
            ),
            body: NoteContentScreenBody(note: note),
          );
        },
      ),
    );
  }
}

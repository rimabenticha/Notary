import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';
import 'package:noteary/features/notes/data/repos/notes_repo.dart';

part 'save_note_state.dart';

class SaveNoteCubit extends Cubit<SaveNoteState> {
  SaveNoteCubit(this._notesRepo) : super(SaveNoteInitial());

  final NotesRepo _notesRepo;

  Future<void> saveNote({required NoteModel note}) async {
    emit(SaveNoteLoading());
    final result = await _notesRepo.saveNote(note: note);
    result.fold(
      (failure) => emit(SaveNoteFailure(errMessage: failure.message)),
      (success) => emit(SaveNoteSuccess()),
    );
  }
}

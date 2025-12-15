import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/notes/data/repos/notes_repo.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit(this._notesRepo) : super(DeleteNoteInitial());

  final NotesRepo _notesRepo;

  Future<void> deleteNote({required String id}) async {
    emit(DeleteNoteLoading());
    final result = await _notesRepo.deleteNote(id: id);
    result.fold(
      (failure) => emit(DeleteNoteFailure(errMessage: failure.message)),
      (success) => emit(DeleteNoteSuccess()),
    );
  }
}

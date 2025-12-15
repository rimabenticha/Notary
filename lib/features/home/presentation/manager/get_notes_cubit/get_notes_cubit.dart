import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';
import 'package:noteary/features/notes/data/repos/notes_repo.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit(this._notesRepo) : super(GetNotesInitial());

  final NotesRepo _notesRepo;

  Future<void> getNotes({required String uid}) async {
    emit(GetNotesLoading());
    final result = await _notesRepo.getNotes(uid: uid);
    result.fold(
      (failure) => emit(GetNotesFailure(errMessage: failure.message)),
      (notes) => emit(GetNotesSuccess(notes: notes)),
    );
  }
}

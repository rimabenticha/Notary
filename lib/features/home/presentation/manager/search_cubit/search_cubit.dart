import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> searchNotes({
    required List<NoteModel> notes,
    required String query,
  }) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    emit(
      SearchSuccess(
        query: query,
        notes: notes
            .where(
              (note) => note.title!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList(),
      ),
    );
  }

  void resetSearch() {
    emit(SearchInitial());
  }
}

part of 'get_notes_cubit.dart';

sealed class GetNotesState extends Equatable {
  const GetNotesState();

  @override
  List<Object> get props => [];
}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesLoading extends GetNotesState {}

final class GetNotesSuccess extends GetNotesState {
  final List<NoteModel> notes;
  const GetNotesSuccess({required this.notes});
  @override
  List<Object> get props => [notes];
}

final class GetNotesFailure extends GetNotesState {
  final String errMessage;
  const GetNotesFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

part of 'save_note_cubit.dart';

sealed class SaveNoteState extends Equatable {
  const SaveNoteState();

  @override
  List<Object> get props => [];
}

final class SaveNoteInitial extends SaveNoteState {}

final class SaveNoteLoading extends SaveNoteState {}

final class SaveNoteSuccess extends SaveNoteState {}

final class SaveNoteFailure extends SaveNoteState {
  final String errMessage;
  const SaveNoteFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
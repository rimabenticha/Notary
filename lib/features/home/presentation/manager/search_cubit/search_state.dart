part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final String query;
  final List<NoteModel> notes;

  const SearchSuccess({required this.query, required this.notes});

  @override
  List<Object> get props => [query, notes];
}

final class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

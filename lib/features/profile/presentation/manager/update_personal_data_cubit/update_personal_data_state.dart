part of 'update_personal_data_cubit.dart';

sealed class UpdatePersonalDataState extends Equatable {
  const UpdatePersonalDataState();

  @override
  List<Object> get props => [];
}

final class UpdatePersonalDataInitial extends UpdatePersonalDataState {}

final class UpdatePersonalDataLoading extends UpdatePersonalDataState {}

final class UpdatePersonalDataSuccess extends UpdatePersonalDataState {
  final User user;
  const UpdatePersonalDataSuccess({required this.user});
}

final class UpdatePersonalDataFailure extends UpdatePersonalDataState {
  final String errMessage;
  const UpdatePersonalDataFailure({required this.errMessage});
}

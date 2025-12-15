part of 'update_password_cubit.dart';

sealed class UpdatePasswordState extends Equatable {
  const UpdatePasswordState();

  @override
  List<Object> get props => [];
}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdatePasswordLoading extends UpdatePasswordState {}

final class UpdatePasswordSuccess extends UpdatePasswordState {}

final class UpdatePasswordFailure extends UpdatePasswordState {
  final String errMessage;
  const UpdatePasswordFailure({required this.errMessage});
}

//* ReAuthentication states
final class ReAuthenticationLoading extends UpdatePasswordState {}

final class ReAuthenticationSuccess extends UpdatePasswordState {}

final class ReAuthenticationFailure extends UpdatePasswordState {
  final String errMessage;

  const ReAuthenticationFailure({required this.errMessage});
}

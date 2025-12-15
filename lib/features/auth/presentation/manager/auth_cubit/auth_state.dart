part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthCubitInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final User user;
  const Authenticated({required this.user});
  @override
  List<Object> get props => [user];
}

final class Unauthenticated extends AuthState {}

final class AuthFailure extends AuthState {
  final String errMessage;
  const AuthFailure({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//* User creation states
final class UserCreationLoading extends AuthState {}

final class UserCreationSuccess extends AuthState {}

final class UserCreationFailure extends AuthState {
  final String errMessage;

  const UserCreationFailure({required this.errMessage});
}

//* Reset password states
final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailure extends AuthState {
  final String errMessage;

  const ResetPasswordFailure({required this.errMessage});
}

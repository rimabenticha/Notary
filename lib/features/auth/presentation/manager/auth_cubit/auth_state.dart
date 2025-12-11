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

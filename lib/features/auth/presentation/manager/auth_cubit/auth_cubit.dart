import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthCubitInitial());

  final AuthRepo _authRepo;

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(AuthLoading());
    final result = await _authRepo.signUp(
      email: email,
      password: password,
      username: username,
    );
    result.fold(
      (failure) => emit(AuthFailure(errMessage: failure.message)),
      (user) => emit(Authenticated(user: user)),
    );
  }
}

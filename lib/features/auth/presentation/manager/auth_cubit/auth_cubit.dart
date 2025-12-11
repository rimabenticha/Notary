import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/auth/data/models/user_model.dart';
import 'package:noteary/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthCubitInitial());

  final AuthRepo _authRepo;

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserModel userModel,
  }) async {
    if (isClosed) return;
    emit(AuthLoading());

    final result = await _authRepo.signUp(
      email: email,
      password: password,
      fullName: fullName,
    );

    if (isClosed) return;

    await result.fold(
      (failure) async {
        emit(AuthFailure(errMessage: failure.message));
      },
      (user) async {
        final createUserResult = await _authRepo.createUser(
          userModel.copyWith(uid: user.uid),
        );

        if (isClosed) return;

        createUserResult.fold(
          (failure) => emit(UserCreationFailure(errMessage: failure.message)),
          (_) => emit(Authenticated(user: user)),
        );
      },
    );
  }

  Future<void> createUser({required UserModel user}) async {
    if (isClosed) return;
    emit(UserCreationLoading());
    final result = await _authRepo.createUser(user);
    if (isClosed) return;
    result.fold(
      (failure) => emit(UserCreationFailure(errMessage: failure.message)),
      (user) => emit(UserCreationSuccess()),
    );
  }
}

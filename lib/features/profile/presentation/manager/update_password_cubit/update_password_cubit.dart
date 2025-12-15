import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/profile/data/repos/profile_repo.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this._profileRepo) : super(UpdatePasswordInitial());

  final ProfileRepo _profileRepo;

  Future<void> reAuthenticateUser({required String oldPassword}) async {
    emit(ReAuthenticationLoading());
    final result = await _profileRepo.reAuthenticateUser(
      oldPassword: oldPassword,
    );
    result.fold(
      (failure) => emit(ReAuthenticationFailure(errMessage: failure.message)),
      (success) => emit(ReAuthenticationSuccess()),
    );
  }

  Future<void> updatePassword({required String newPassword}) async {
    emit(UpdatePasswordLoading());
    final result = await _profileRepo.updatePassword(newPassword: newPassword);
    result.fold(
      (failure) => emit(UpdatePasswordFailure(errMessage: failure.message)),
      (success) => emit(UpdatePasswordSuccess()),
    );
  }
}

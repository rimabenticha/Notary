import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/profile/data/repos/profile_repo.dart';

part 'update_personal_data_state.dart';

class UpdatePersonalDataCubit extends Cubit<UpdatePersonalDataState> {
  UpdatePersonalDataCubit(this._profileRepo)
    : super(UpdatePersonalDataInitial());

  final ProfileRepo _profileRepo;

  Future<void> updatePersonalData({String? fullName}) async {
    emit(UpdatePersonalDataLoading());
    final result = await _profileRepo.updatePersonalData(fullName: fullName);
    result.fold(
      (failure) => emit(UpdatePersonalDataFailure(errMessage: failure.message)),
      (user) => emit(UpdatePersonalDataSuccess(user: user)),
    );
  }
}

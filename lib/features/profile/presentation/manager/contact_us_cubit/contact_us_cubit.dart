import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/profile/data/models/contact_us_model.dart';
import 'package:noteary/features/profile/data/repos/profile_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this._profileRepo) : super(ContactUsInitial());

  final ProfileRepo _profileRepo;

  Future<void> sendContactUs({required ContactUsModel contactUs}) async {
    emit(ContactUsLoading());
    final result = await _profileRepo.contactUs(contactUs: contactUs);
    result.fold(
      (failure) => emit(ContactUsFailure(errMessage: failure.message)),
      (success) => emit(ContactUsSuccess()),
    );
  }
}

part of 'contact_us_cubit.dart';

sealed class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object> get props => [];
}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoading extends ContactUsState {}

final class ContactUsSuccess extends ContactUsState {}

final class ContactUsFailure extends ContactUsState {
  final String errMessage;
  const ContactUsFailure({required this.errMessage});
}

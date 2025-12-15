import 'package:equatable/equatable.dart';

class ContactUsModel extends Equatable {
  final String? uid;
  final String? name;
  final String? email;
  final String? message;

  const ContactUsModel({this.uid, this.name, this.email, this.message});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
    uid: json['uid'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    message: json['message'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'email': email,
    'message': message,
  };

  ContactUsModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? message,
  }) {
    return ContactUsModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [uid, name, email, message];
}

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? uid;
  final String? fullName;
  final String? email;

  const UserModel({this.uid, this.fullName, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'] as String?,
    fullName: json['fullName'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'fullName': fullName,
    'email': email,
  };

  UserModel copyWith({String? uid, String? fullName, String? email}) {
    return UserModel(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [uid, fullName, email];
}

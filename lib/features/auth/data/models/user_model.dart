import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userId;
  final String? fullName;
  final String? email;

  const UserModel({this.userId, this.fullName, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['userId'] as String?,
    fullName: json['fullName'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'fullName': fullName,
    'email': email,
  };

  UserModel copyWith({String? userId, String? fullName, String? email}) {
    return UserModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [userId, fullName, email];
}

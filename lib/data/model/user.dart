import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? username;
  final String? email;
  final String? phoneNumber;

  const User({required this.id, this.email, this.username, this.phoneNumber});

  factory User.fromJson(
    Map<String, dynamic> json,
      String id
  ) =>
      User(
          id: id,
          username: json['username'],
          email: json['email'],
          phoneNumber: json['phoneNumber']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber
      };

  @override
  List<Object?> get props => [id, email, username, phoneNumber];
}

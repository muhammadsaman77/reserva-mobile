import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? name;
  final String? email;



  const User({required this.id, this.email, this.name, });

  static const empty = User(id: '');

  @override
  List<Object?> get props => [id, email, name];
}

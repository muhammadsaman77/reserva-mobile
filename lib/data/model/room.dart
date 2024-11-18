import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final String id;
  final String name;

  const Room({required this.id, required this.name});

  factory Room.fromJson(Map<String, dynamic> json, String id) =>
      Room(id: id, name: json['name']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}


import 'package:booking_app/data/model/user.dart';
import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final int id;
  final String name;
  final String description;
  final int price;


  const Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,

  });
  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,

  };

  @override
  List<Object?> get props => [id, name, description, price];

}
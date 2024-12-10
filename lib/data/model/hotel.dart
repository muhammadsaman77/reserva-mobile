
import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final String id;
  final String name;
  final String description;
  final int price;
  final String address;
  final List<dynamic> images;
  final double rating;


  const Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.rating,
    required this.images


  });
  factory Hotel.fromJson(Map<String, dynamic> json, String id) => Hotel(
      id: id,
    name: json["name"],
    description: json["description"],
    price: json["price"],
    address: json["address"],
    rating: json["rating"],
    images: json["images"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "address": address,
    "rating": rating,
    "images": images

  };

  @override
  List<Object?> get props => [id, name, description, price,address,rating,images];

}
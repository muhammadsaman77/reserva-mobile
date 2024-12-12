import 'package:booking_app/data/model/hotel.dart';
import 'package:booking_app/data/model/room.dart';
import 'package:equatable/equatable.dart';

class BookingHistory extends Equatable {
  final String? id;
  final Hotel? hotel;
  final Room? room;
  final DateTime startDate;
  final DateTime endDate;

  const BookingHistory({
    this.id,
     this.hotel,
     this.room,
    required this.startDate,
    required this.endDate,
  });

  // fromJson untuk mengonversi data JSON ke objek BookingHistory
  factory BookingHistory.fromJson(
      Map<String, dynamic> json, String id, String hotelId, String roomId) {
    return BookingHistory(
      id: id,
      hotel: Hotel.fromJson(json['hotel'] as Map<String, dynamic>, hotelId),
      room: Room.fromJson(json['room'] as Map<String, dynamic>, roomId),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
    );
  }

  // toJson untuk mengonversi objek BookingHistory ke data JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotel': hotel?.toJson(),
      'room': room?.toJson(),
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, startDate, endDate, hotel, room];
}

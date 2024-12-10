import 'package:booking_app/data/model/transaction.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final String? id;
  final Transaction transaction;
  final String userId;
  final String hotelId;
  final String roomId;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  const Booking({
    this.id,
    required this.transaction,
    required this.userId,
    required this.roomId,
    required this.hotelId,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  @override
  List<Object?> get props => [
    id,
    transaction,
    userId,
    roomId,
    hotelId,
    startDate,
    endDate,
    status,
  ];

  /// Converts a JSON map to a Booking object
  factory Booking.fromJson(Map<String, dynamic> json, String id) {
    return Booking(
      id: id,
      transaction: Transaction.fromJson(json['transaction']),
      userId: json['user_id'] as String,
      roomId: json['room_id'] as String,
      hotelId: json['hotel_id'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      status: json['status'] as String,
    );
  }

  /// Converts a Booking object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'transaction': transaction.toJson(),
      'user_id': userId,
      'room_id': roomId,
      'hotel_id': hotelId,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'status': status,
    };
  }
}

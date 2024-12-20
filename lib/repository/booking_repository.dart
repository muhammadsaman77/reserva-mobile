import 'package:booking_app/data/model/booking.dart';
import 'package:booking_app/data/model/booking_history.dart';
import 'package:booking_app/data/model/hotel.dart';
import 'package:booking_app/data/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createBooking(Booking booking) async {
    try {
      final bookingsRef = _db.collection('bookings');
      await bookingsRef.add(booking.toJson());
    } catch (e) {
      throw Exception('Failed to create booking: $e');
    }
  }

  Future<List<BookingHistory>> getBookings(userId) async {
    try {
      QuerySnapshot bookingSnapshot = await _db.collection('bookings')
          .where('user_id', isEqualTo: userId).get();

      List<BookingHistory> bookingHistoryList = [];

      for (var bookingDoc in bookingSnapshot.docs) {
        final bookingData = bookingDoc.data() as Map<String, dynamic>;
        final String hotelId = bookingData['hotel_id'] as String;

        DocumentSnapshot hotelDoc =
            await _db.collection('hotels').doc(hotelId).get();
        if (!hotelDoc.exists) {
          throw Exception('Hotel not found');
        }
        final hotelData = hotelDoc.data() as Map<String, dynamic>;
        final hotel = Hotel.fromJson(hotelData, hotelDoc.id);
        final String roomId = bookingData['room_id'] as String;
        DocumentSnapshot roomDoc =
            await _db.collection('rooms').doc(roomId).get();
        if (!roomDoc.exists) {
          throw Exception('Hotel not found');
        }
        final roomData = roomDoc.data() as Map<String, dynamic>;
        final room = Room.fromJson(roomData, roomDoc.id);
        final bookingHistory = BookingHistory.fromJson({
          ...bookingData,
          'room': room.toJson(),
          'hotel': hotel.toJson(),
        }, bookingDoc.id, hotelId, roomId);

        bookingHistoryList.add(bookingHistory);
      }

      return bookingHistoryList;
    } catch (e) {
      throw Exception('Failed to fetch bookings: $e');
    }
  }
  Future<List<BookingHistory>> getBookingByRoomId(String roomId) async {
    try {
      final response = await _db.collection("bookings").where("room_id",isEqualTo: roomId).get();
      return response.docs.map((e) => BookingHistory(startDate: DateTime.parse( e.data()["start_date"]), endDate:DateTime.parse( e.data()["end_date"]))).toList();

    } catch (e) {
      throw Exception('Failed to fetch bookings: $e');
    }
  }
}

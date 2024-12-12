

import 'package:booking_app/data/model/booking_history.dart';
import 'package:intl/intl.dart';

String convertDatetimeFormat (inputDate){
  return DateFormat("dd-MM-yyyy").format(inputDate);
}

List<DateTime> generateDatesInRange(DateTime startDate, DateTime endDate) {
  List<DateTime> dates = [];

  // Normalisasi waktu ke 00:00:00 untuk kedua tanggal
  DateTime currentDate = DateTime(startDate.year, startDate.month, startDate.day);
  DateTime normalizedEndDate = DateTime(endDate.year, endDate.month, endDate.day);

  // Tambahkan tanggal ke dalam daftar hingga mencapai endDate
  while (currentDate.isBefore(normalizedEndDate) || currentDate.isAtSameMomentAs(normalizedEndDate)) {
    dates.add(currentDate);
    currentDate = currentDate.add(const Duration(days: 1)); // Increment 1 hari
  }

  return dates;
}

List<DateTime> generateBlackoutDates(List<BookingHistory> bookingHistory) {
  List<DateTime> blackoutDates = [];
  for (var booking in bookingHistory) {
    blackoutDates.addAll(generateDatesInRange(
      DateTime(booking.startDate.year, booking.startDate.month, booking.startDate.day),
      DateTime(booking.endDate.year, booking.endDate.month, booking.endDate.day),
    ));
  }
  return blackoutDates;
}


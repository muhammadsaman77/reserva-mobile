
part of 'booking_history_bloc.dart';
abstract class BookingHistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBookingHistory extends BookingHistoryEvent {}
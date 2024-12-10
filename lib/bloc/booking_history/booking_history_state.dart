part of 'booking_history_bloc.dart';

abstract class BookingHistoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookingHistoryInitial extends BookingHistoryState {}

class BookingHistoryLoading extends BookingHistoryState {}

class BookingHistoryLoaded extends BookingHistoryState {
  final List<BookingHistory> bookingHistory;

  BookingHistoryLoaded(this.bookingHistory);

  @override
  List<Object?> get props => [bookingHistory];
}

class BookingHistoryError extends BookingHistoryState {
  final String message;

  BookingHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
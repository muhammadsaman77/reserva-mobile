import 'package:booking_app/data/model/booking_history.dart';
import 'package:booking_app/repository/auth_repository.dart';
import 'package:booking_app/repository/booking_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_history_state.dart';
part 'booking_history_event.dart';

class BookingHistoryBloc extends Bloc<BookingHistoryEvent, BookingHistoryState> {
  final BookingRepository bookingHistoryRepository = BookingRepository();
  final AuthRepository authRepository = AuthRepository();
  BookingHistoryBloc()
      : super(BookingHistoryInitial()) {
    on<LoadBookingHistory>((event, emit) async {
      try {
        emit(BookingHistoryLoading());
        final bookingHistoryList = await bookingHistoryRepository.getBookings(authRepository.getCurrentUser()?.uid);
        emit(BookingHistoryLoaded(bookingHistoryList));
      } catch (e) {

        // Jika terjadi error, emit state error
        emit(BookingHistoryError(e.toString()));
      }
    });
  }
}
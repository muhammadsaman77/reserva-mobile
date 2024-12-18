import 'package:booking_app/data/model/booking_history.dart';
import 'package:booking_app/repository/booking_repository.dart';
import 'package:booking_app/util/datetime_manipulation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerState(startDate: null, endDate: null));

  void resetState() {
    emit(DatePickerState());
  }
  void updateDateRange(DateTime start, DateTime end) {
    emit(state.copyWith(startDate: start, endDate: end));
  }
  void updateBlackoutDates(String roomId) async{
    try{
      List<BookingHistory> bookingHistory = await BookingRepository().getBookingByRoomId(roomId);
      List<DateTime> blackOutDates = generateBlackoutDates(bookingHistory);
      emit(state.copyWith(
        blackoutDates: blackOutDates
      ));

    }catch(e){
      rethrow;
    }

  }

  void showDatePicker() {
    emit(state.copyWith(startDate: null,endDate: null, isDatePickerVisible: true));
  }

  void hideDatePicker() {
    emit(state.copyWith(startDate: null,endDate: null, isDatePickerVisible: false));
  }


}
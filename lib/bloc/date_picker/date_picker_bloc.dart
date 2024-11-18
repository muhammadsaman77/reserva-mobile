import 'package:flutter_bloc/flutter_bloc.dart';

part 'date_picker_state.dart';

class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerState(startDate: null, endDate: null));


  void updateDateRange(DateTime start, DateTime end) {
    emit(DatePickerState(startDate: start, endDate: end));
  }
  void toggleDatePickerVisibility() {
    emit(state.copyWith(isDatePickerVisible: !state.isDatePickerVisible));
  }
}
part of 'date_picker_cubit.dart';

class DatePickerState {
  final DateTime? startDate;
  final DateTime? endDate;
  final List<DateTime>? blackoutDates;
  final bool isDatePickerVisible;

  DatePickerState({this.startDate, this.endDate,this.isDatePickerVisible=false,this.blackoutDates});
  DatePickerState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    bool? isDatePickerVisible,
    List<DateTime>? blackoutDates
  }) {
    return DatePickerState(
      startDate: startDate,
      endDate: endDate,
      isDatePickerVisible: isDatePickerVisible ?? this.isDatePickerVisible,
      blackoutDates: blackoutDates ?? this.blackoutDates
    );
  }
}
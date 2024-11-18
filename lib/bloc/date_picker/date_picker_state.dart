part of 'date_picker_bloc.dart';

class DatePickerState {
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isDatePickerVisible;

  DatePickerState({this.startDate, this.endDate,this.isDatePickerVisible=false});
  DatePickerState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    bool? isDatePickerVisible,
  }) {
    return DatePickerState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isDatePickerVisible: isDatePickerVisible ?? this.isDatePickerVisible,
    );
  }
}
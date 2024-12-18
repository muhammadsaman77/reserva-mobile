part of 'calendar_bloc.dart';

// Event untuk kalender
abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

// Event ketika hari dipilih
class DaySelected extends CalendarEvent {
  final DateTime selectedDay;

  const DaySelected(this.selectedDay);

  @override
  List<Object> get props => [selectedDay];
}

// Event untuk menambah event pada hari tertentu
class AddEvent extends CalendarEvent {
  final DateTime day;
  final String title;

  const AddEvent(this.day, this.title);

  @override
  List<Object> get props => [day, title];
}
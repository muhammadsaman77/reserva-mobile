part of 'calendar_bloc.dart';

// State untuk kalender
abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

// State awal kalender
class CalendarInitial extends CalendarState {}

// State saat hari dipilih
class CalendarDaySelected extends CalendarState {
  final DateTime selectedDay;
  final List<Event> events;

  const CalendarDaySelected(this.selectedDay, this.events);

  @override
  List<Object> get props => [selectedDay, events];
}
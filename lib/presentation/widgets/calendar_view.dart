import 'package:booking_app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.utc(2024, 10, 17),
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
    calendarStyle: CalendarStyle(
    todayDecoration: BoxDecoration(
    color: blueNormal,
    shape: BoxShape.circle,
    ),
    ),
    );
  }
}

import 'package:booking_app/bloc/choice/choice_cubit.dart';
import 'package:booking_app/bloc/date_picker/date_picker_cubit.dart';

import 'package:booking_app/bloc/detail/detail_bloc.dart';
import 'package:booking_app/constant/color.dart';
import 'package:booking_app/presentation/widgets/choice_room.dart';
import 'package:booking_app/util/datetime_manipulation.dart';
import 'package:booking_app/util/generateId.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingDialog extends StatelessWidget {
  const BookingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final choiceCubit = context.read<ChoiceCubit>();

    return BlocListener<DetailBloc, DetailState>(
      listener: (context, state) {
        if (state is DetailLoaded) {
          final rooms = state.rooms;

          choiceCubit.updateRooms(rooms, state.hotel.id);
        }
      },
      child: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoaded) {
            return Container(
              height: context.watch<DatePickerCubit>().state.isDatePickerVisible
                  ? 600
                  : 300,
              padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Book your desired room",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        "Choose the best room for you",
                        style: TextStyle(
                            color: lighter,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "Rp " + state.hotel.price.toString(),
                            style: TextStyle(
                                color: blueNormal,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            " /night",
                            style: TextStyle(color: lighter),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: NetworkImage(state.hotel.images[0]),
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 3,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: BlocBuilder<ChoiceCubit, ChoiceState>(
                              builder: (context, choiceState) {
                                return ChoiceRoom(
                                  choices: choiceState.rooms,
                                  selectedValue: choiceState.selectedValue,
                                  setSelectedValue: choiceCubit.selectRoom,
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("Date: "),
                                  SizedBox(
                                    width: 150,
                                    child: BlocBuilder<DatePickerCubit,
                                        DatePickerState>(
                                      builder: (context, dateState) {
                                        return Text(
                                            dateState.startDate != null &&
                                                    dateState.endDate != null
                                                ? "${convertDatetimeFormat(dateState.startDate)} to ${convertDatetimeFormat(dateState.endDate)}"
                                                : "Select Date Range",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: lighter
                                            ));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  BlocBuilder<DatePickerCubit, DatePickerState>(
                    builder: (context, datePickerState) {
                      if (!datePickerState.isDatePickerVisible)
                        return Container();
                      return Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(8),
                        child: SfDateRangePicker(
                          selectionMode: DateRangePickerSelectionMode.range,
                          minDate: DateTime.now(),
                          monthViewSettings: DateRangePickerMonthViewSettings(
                            blackoutDates: context.read<DatePickerCubit>().state.blackoutDates,
                          ),monthCellStyle: const DateRangePickerMonthCellStyle(

                          blackoutDatesDecoration: BoxDecoration(
                            color: lighter, // Latar belakang merah
                            shape: BoxShape.circle, // Bentuk lingkaran
                          ),

                          blackoutDateTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                          onSelectionChanged: (args) {
                            if (args.value is PickerDateRange) {
                              final dateRange = args.value as PickerDateRange;

                              context.read<DatePickerCubit>().updateDateRange(
                                  dateRange.startDate!,
                                  dateRange.endDate ?? dateRange.startDate!);

                            }
                          },

                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var room =
                          context.read<ChoiceCubit>().state.selectedValue;
                      var dateRange = context.read<DatePickerCubit>().state;
                      var difference = dateRange.endDate!
                              .difference(dateRange.startDate!)
                              .inDays +
                          1;
                      var price = state.hotel.price * difference;
                      Navigator.of(context).pushNamed('/payment', arguments: {
                        'orderId': generateOrderId(),
                        'grossAmount': price,
                      });
                    },
                    child: Center(
                      child: Text('Booking'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueNormal,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

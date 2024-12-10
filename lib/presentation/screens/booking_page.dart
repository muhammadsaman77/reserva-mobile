import 'package:booking_app/bloc/booking_history/booking_history_bloc.dart';
import 'package:booking_app/constant/color.dart';
import 'package:booking_app/data/dummy/booking_data.dart';
import 'package:booking_app/presentation/widgets/calendar_view.dart';
import 'package:booking_app/presentation/widgets/card_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingPage extends StatelessWidget {
  final List<BookingData> data = bookingData;

  BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
  
            SizedBox(height: 10),
            Text(
              "My Booking",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: BlocBuilder<BookingHistoryBloc, BookingHistoryState>(
                  builder: (context, state) {
                if (state is BookingHistoryInitial) {
                  context.read<BookingHistoryBloc>().add(LoadBookingHistory());
                }
                if (state is BookingHistoryLoaded) {
                  print("anjay");

                  return ListView.builder(
                    itemCount: state.bookingHistory.length,
                    itemBuilder: (context, index) {

                      return Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          CardBooking(
                            id: state.bookingHistory[index].id,
                            image: state.bookingHistory[index].hotel.images[0],
                            date:  state.bookingHistory[index].startDate.toString() ,
                            name: state.bookingHistory[index].hotel.name,
                            price: state.bookingHistory[index].hotel.price.toString(),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    },
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

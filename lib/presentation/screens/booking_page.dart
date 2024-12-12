import 'package:booking_app/bloc/booking_history/booking_history_bloc.dart';
import 'package:booking_app/constant/color.dart';
import 'package:booking_app/data/dummy/booking_data.dart';
import 'package:booking_app/presentation/widgets/calendar_view.dart';
import 'package:booking_app/presentation/widgets/card_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingPage extends StatelessWidget {


  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: BlocBuilder<BookingHistoryBloc, BookingHistoryState>(
                builder: (context, state) {
              if (state is BookingHistoryLoaded) {

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
                          image: state.bookingHistory[index].hotel!.images[0],
                          startDate: state.bookingHistory[index].startDate,
                          endDate: state.bookingHistory[index].endDate,
                          name: state.bookingHistory[index].hotel!.name,
                          price: state.bookingHistory[index].hotel!.price.toString(),
                          onTap: () {
                            Navigator.of(context).pushNamed('/detail',
                                arguments: {
                                  'id': state.bookingHistory[index].hotel!.id,
                                  'is_history': true,
                                  'room': state.bookingHistory[index].room!.name,
                                  'start_date': state.bookingHistory[index].startDate,
                                  'end_date': state.bookingHistory[index].endDate

                                }
                                );
                          },
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
    );
  }
}

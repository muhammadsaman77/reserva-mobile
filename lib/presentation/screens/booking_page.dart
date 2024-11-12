import 'package:booking_app/constant/color.dart';
import 'package:booking_app/data/dummy/booking_data.dart';
import 'package:booking_app/presentation/widgets/calendar_view.dart';
import 'package:booking_app/presentation/widgets/card_booking.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  List<BookingData> data = bookingData;

  BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 20,),
          CalendarView(),
          SizedBox(height: 10),
          Divider(
            color: lighter,
            thickness: 0.5,
          ),
          SizedBox(height: 10),
          Text("My Booking",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 5,),
                    CardBooking(id: data[index].id,
                        image: data[index].image,
                        date: data[index].date,
                        name: data[index].name,
                        price: data[index].price,
                    ),
                    SizedBox(height: 5,)
                  ],
                );


              },),
          )
        ],
      ),
    ));
  }
}

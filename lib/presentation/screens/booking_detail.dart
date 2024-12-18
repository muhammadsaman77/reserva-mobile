import 'package:flutter/material.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text('Booking Detail',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: const Center(
        child: Text('Booking Detail'),
      ),
    );
  }
}

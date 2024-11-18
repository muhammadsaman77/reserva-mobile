import 'package:booking_app/bloc/payment/payment_bloc.dart';
import 'package:booking_app/presentation/screens/payment_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage  extends StatelessWidget{
  final String orderId;
  final int grossAmount;

  const PaymentPage({super.key, required this.orderId, required this.grossAmount});
  @override
  Widget build(BuildContext context) {
    context.read<PaymentBloc>().add(StartTransaction(orderId, grossAmount));
    return Scaffold(

      appBar: AppBar(title: const Text('Payment'),),
      body: BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
        if (state is PaymentLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PaymentError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is PaymentSuccess) {

          return PaymentWebview(snapToken: state.snapToken);
        }
        return Center(
          child: Text("Memulai Transaksi..."),
        );
      },)
    );
  }
}
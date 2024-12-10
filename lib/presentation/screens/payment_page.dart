import 'package:booking_app/bloc/choice/choice_cubit.dart';
import 'package:booking_app/bloc/date_picker/date_picker_bloc.dart';
import 'package:booking_app/bloc/payment/payment_bloc.dart';
import 'package:booking_app/config/api_config.dart';
import 'package:booking_app/presentation/screens/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final orderId = args['orderId'];
    final grossAmount = args['grossAmount'];
    context
        .read<PaymentBloc>()
        .add(StartTransaction(orderId: orderId, grossAmount: grossAmount));
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Payment'),
        ),
        body:
            BlocConsumer<PaymentBloc, PaymentState>(listener: (context, state) {
          // if (state is PaymentStatusLoaded) {
          //   final transactionStatus = state.status["transaction_status"];
          //   if (transactionStatus == "settlement" ||
          //       transactionStatus == "capture") {
          //   } else {
          //
          //   }
          // }
        }, builder: (context, state) {
          if (state is PaymentSuccess) {
            return WebViewWidget(
                controller: WebViewController()
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..loadRequest(Uri.parse("$midtransUrl/${state.snapToken}"))
                  ..setNavigationDelegate(NavigationDelegate(
                    onWebResourceError: (error) {
                      print("erorr :$error");
                    },
                    onPageFinished: (url) {
                      if (url.contains(
                          "https://simulator.sandbox.midtrans.com/v2/deeplink/payment")) {

                        final room =
                            context.read<ChoiceCubit>().state;
                        final dateRange = context.read<DatePickerCubit>().state;

                        context.read<PaymentBloc>().add(CheckTransactionStatus(
                              orderId: orderId,
                              roomId: room.selectedValue!.id,
                              hotelId: room.hotelId,
                              startDate: dateRange.startDate!,
                              endDate: dateRange.endDate!,
                            ));
                      }
                    },
                  )));
          }
          if (state is PaymentLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PaymentStatusLoaded) {
            final transactionStatus = state.status["transaction_status"];
            if (transactionStatus == "settlement" ||
                transactionStatus == "capture") {
              return SuccessPage();
            }
          }
          if (state is PaymentError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}

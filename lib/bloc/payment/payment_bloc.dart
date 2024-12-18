import 'dart:convert';
import 'package:booking_app/config/api_config.dart';
import 'package:booking_app/data/model/booking.dart';
import 'package:booking_app/data/model/transaction.dart';
import 'package:booking_app/repository/auth_repository.dart';
import 'package:booking_app/repository/booking_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

part 'payment_event.dart';

  class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {

    Set<String> processedOrderIds = {};
    PaymentBloc() : super(PaymentInitial()) {
      on<StartTransaction>((event, emit) async {

        try {
          if (processedOrderIds.contains(event.orderId)) {
            emit(PaymentError("This order ID has already been processed."));
            return;
          }
          processedOrderIds.add(event.orderId);
          emit(PaymentLoading());
          final user = await AuthRepository().getFullUser();

          final response = await http.post(Uri.parse("$baseUrl/generate-token".trim()) ,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "order_id": event.orderId,
                "gross_amount": event.grossAmount,
                "first_name": user.username,
                "email": user.email,
                "phone": user.phoneNumber
              }));
          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            final snapToken = data["token"];
            emit(PaymentSuccess(snapToken: snapToken));

          }
        }

        catch (e) {
          // print(e);
          emit(PaymentError(e.toString()));
        }
      });
      on<TransactionCompleted>((event, emit) {

          emit(PaymentInitial());

      });
      on<CheckTransactionStatus>((event, emit) async {
    try {
      emit(PaymentLoading());
      final response = await http.get(Uri.parse("$baseUrl/status/${event.orderId}".trim()));
      if (response.statusCode == 200) {
        final status = jsonDecode(response.body);
        if (status["transaction_status"] == "settlement" ||
            status["transaction_status"] == "capture") {

          Transaction transaction = Transaction.fromJson(status);


          final currentUser = AuthRepository().getCurrentUser();

          if (currentUser != null) {

            Booking booking = Booking(
              transaction: transaction,
              userId: currentUser.uid,
              roomId: event.roomId,
              hotelId: event.hotelId,
              startDate: event.startDate,
              endDate: event.endDate,


              status: "check_in",
            );
            await BookingRepository().createBooking(booking);
          } else {
           throw Exception("User not found");
          }


          emit(PaymentStatusLoaded(status));
        }


      }else{
        throw Exception("Failed to fetch transaction status");
      }
    }
    catch (e) {

      emit(PaymentError(e.toString()));
    }
      });
    }

  }

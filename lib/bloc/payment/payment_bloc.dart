import 'dart:convert';

import 'package:booking_app/config/api_config.dart';
import 'package:booking_app/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

part 'payment_event.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<StartTransaction>((event, emit) async {
      try {
        emit(PaymentLoading());
        final user = await AuthRepository().getFullUser();

        final response = await http.post(("$baseUrl/payment") as Uri,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "order_id": event.orderId,
              "gross_amount": event.grossAmount,
              "first_name": user.username,
              "email": user.username,
              "phone": user.phoneNumber
            }));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final snapToken = data["token"];
          emit(PaymentSuccess(snapToken: snapToken));

        }
      } catch (e) {
        print(e);
        emit(PaymentError(e.toString()));
      }
    });
  }
}

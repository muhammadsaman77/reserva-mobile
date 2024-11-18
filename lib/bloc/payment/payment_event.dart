part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class StartTransaction  extends PaymentEvent {
  final String orderId;
  final int grossAmount;

  const StartTransaction(this.orderId, this.grossAmount);

  @override
  List<Object> get props => [orderId, grossAmount];
}

class TransactionCompleted extends PaymentEvent {
  final bool success;

  TransactionCompleted({required this.success});

  @override
  List<Object> get props => [success];
}
part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class StartTransaction  extends PaymentEvent {
  final String orderId;
  final int grossAmount;

  const StartTransaction({required this.orderId,required this.grossAmount});

  @override
  List<Object> get props => [orderId, grossAmount];
}
class CheckTransactionStatus extends PaymentEvent {
  final String orderId;
  final String roomId;
  final String hotelId;
  final DateTime startDate;
  final DateTime endDate;

  const CheckTransactionStatus({
    required this.orderId,
    required this.roomId,
    required this.hotelId,
    required this.startDate,
    required this.endDate
});

  @override
  List<Object> get props => [orderId,roomId,startDate,endDate];
}
class TransactionCompleted extends PaymentEvent {

  TransactionCompleted();

}
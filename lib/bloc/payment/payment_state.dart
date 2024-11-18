
part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable{
  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState{}

class PaymentLoading extends PaymentState{}

class PaymentSuccess extends PaymentState{
  final String snapToken;
  PaymentSuccess({required this.snapToken});

  @override
  List<Object?> get props => [snapToken];
}

class PaymentError extends PaymentState{
  final String error;
  PaymentError( this.error);

  @override
  List<Object?> get props => [error];
}


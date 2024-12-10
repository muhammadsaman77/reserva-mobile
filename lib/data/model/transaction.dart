import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String transactionId;
  final String orderId;
  final double grossAmount;
  final String currency;
  final String paymentType;
  final DateTime transactionTime;
  final String transactionStatus;
  final String fraudStatus;
  final String? vaNumber; // Nullable since it may not always have a value
  final String? bank; // Nullable
  final String? pdfUrl; // Nullable
  final String signatureKey;
  final DateTime expiryTime;

  const Transaction({
    required this.transactionId,
    required this.orderId,
    required this.currency,
    required this.grossAmount,
    required this.paymentType,
    required this.transactionTime,
    required this.transactionStatus,
    required this.fraudStatus,
    this.vaNumber,
    this.bank,
    this.pdfUrl,
    required this.signatureKey,
    required this.expiryTime,
  });

  @override
  List<Object?> get props => [
    transactionId,
    orderId,
    currency,
    grossAmount,
    paymentType,
    transactionTime,
    transactionStatus,
    fraudStatus,
    vaNumber,
    bank,
    pdfUrl,
    signatureKey,
    expiryTime,
  ];

  /// Converts a JSON map to a Transaction object
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transaction_id'] as String,
      orderId: json['order_id'] as String,
      currency: json['currency'] as String,
      grossAmount: json['gross_amount'] is String
          ? double.parse(json['gross_amount'] as String)
          : (json['gross_amount'] as num).toDouble(),
      paymentType: json['payment_type'] as String,
      transactionTime: DateTime.parse(json['transaction_time'] as String),
      transactionStatus: json['transaction_status'] as String,
      fraudStatus: json['fraud_status'] as String,
      vaNumber: json['va_number'] as String?,
      bank: json['bank'] as String?,
      pdfUrl: json['pdf_url'] as String?,
      signatureKey: json['signature_key'] as String,
      expiryTime: DateTime.parse(json['expiry_time'] as String),
    );
  }

  /// Converts a Transaction object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'order_id': orderId,
      'currency': currency,
      'gross_amount': grossAmount,
      'payment_type': paymentType,
      'transaction_time': transactionTime.toIso8601String(),
      'transaction_status': transactionStatus,
      'fraud_status': fraudStatus,
      'va_number': vaNumber,
      'bank': bank,
      'pdf_url': pdfUrl,
      'signature_key': signatureKey,
      'expiry_time': expiryTime.toIso8601String(),
    };
  }
}

class StripePaymentIntentInputModel {
  final double amount;
  final String currency;
  final String customerId;

  StripePaymentIntentInputModel({
    required this.customerId,
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    final int cents = (amount * 100).toInt();

    return {
      'amount': cents,
      'currency': currency,
      'customer': customerId,
    };
  }
}


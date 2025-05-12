class PaymobPaymentInputModel {
  final int? amount;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  const PaymobPaymentInputModel({
     this.amount,
     this.firstName,
     this.lastName,
     this.email,
     this.phone,
  });

  get amountCentsString => (amount! * 100).toString();
}
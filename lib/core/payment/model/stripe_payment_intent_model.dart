import 'package:json_annotation/json_annotation.dart';

part 'stripe_payment_intent_model.g.dart';

@JsonSerializable()
class StripePaymentIntentModel {
  final String? id;
  final String? object;
  final int? amount;

  @JsonKey(name: 'amount_capturable')
  final int? amountCapturable;

  @JsonKey(name: 'amount_received')
  final int? amountReceived;

  final dynamic application;

  @JsonKey(name: 'application_fee_amount')
  final dynamic applicationFeeAmount;

  @JsonKey(name: 'automatic_payment_methods')
  final dynamic automaticPaymentMethods;

  @JsonKey(name: 'canceled_at')
  final dynamic canceledAt;

  @JsonKey(name: 'cancellation_reason')
  final dynamic cancellationReason;

  @JsonKey(name: 'capture_method')
  final String? captureMethod;

  @JsonKey(name: 'client_secret')
  final String? clientSecret;

  @JsonKey(name: 'confirmation_method')
  final String? confirmationMethod;

  final int? created;
  final String? currency;
  final dynamic customer;
  final String? description;
  final dynamic invoice;

  @JsonKey(name: 'last_payment_error')
  final dynamic lastPaymentError;

  @JsonKey(name: 'latest_charge')
  final dynamic latestCharge;

  final bool? livemode;

  @JsonKey(name: 'next_action')
  final dynamic nextAction;

  @JsonKey(name: 'on_behalf_of')
  final dynamic onBehalfOf;

  @JsonKey(name: 'payment_method')
  final dynamic paymentMethod;

  @JsonKey(name: 'payment_method_configuration_details')
  final dynamic paymentMethodConfigurationDetails;

  @JsonKey(name: 'payment_method_options')
  final PaymentMethodOptions? paymentMethodOptions;

  @JsonKey(name: 'payment_method_types')
  final List<dynamic>? paymentMethodTypes;

  final dynamic processing;

  @JsonKey(name: 'receipt_email')
  final dynamic receiptEmail;

  final dynamic review;

  @JsonKey(name: 'setup_future_usage')
  final dynamic setupFutureUsage;

  final dynamic shipping;

  @JsonKey(name: 'statement_descriptor')
  final dynamic statementDescriptor;

  @JsonKey(name: 'statement_descriptor_suffix')
  final dynamic statementDescriptorSuffix;

  final String? status;

  @JsonKey(name: 'transfer_data')
  final dynamic transferData;

  @JsonKey(name: 'transfer_group')
  final dynamic transferGroup;

  const StripePaymentIntentModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory StripePaymentIntentModel.fromJson(Map<String, dynamic> json) =>
      _$StripePaymentIntentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StripePaymentIntentModelToJson(this);
}


@JsonSerializable()
class PaymentMethodOptions {
  final Card? card;

  const PaymentMethodOptions({this.card});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodOptionsToJson(this);
}

@JsonSerializable()
class Card {
  final dynamic installments;

  @JsonKey(name: 'mandate_options')
  final dynamic mandateOptions;

  final dynamic network;

  @JsonKey(name: 'request_three_d_secure')
  final String? requestThreeDSecure;

  const Card({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  factory Card.fromJson(Map<String, dynamic> json) =>
      _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentKeys {
  static final String stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? '';
  static final String stripePublishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  static final String paypalClientId = dotenv.env['PAYPAL_CLIENT_ID'] ?? '';
  static final String paypalSecretKey = dotenv.env['PAYPAL_SECRET_KEY'] ?? '';
  static final String payMopApiKey = dotenv.env['PAYMOP_API_KEY'] ?? '';
  static final String payMopIntegrationId = dotenv.env['PAYMOP_INTEGRATION_ID'] ?? '';
}


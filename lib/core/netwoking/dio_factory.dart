import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/constants/payment_keys.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum DioType {
  defaultDio,
  stripeDio,
  paymobDio,
}

class DioFactory {
  static final Map<DioType, Dio> _dioMap = {};

  static Future<Dio> getDio(DioType type) async {
    if (_dioMap.containsKey(type)) return _dioMap[type]!;

    final dio = Dio();
    _applyCommonConfig(dio);

    switch (type) {
      case DioType.defaultDio:
        await _applyDefaultHeaders(dio);
        break;
      case DioType.stripeDio:
        _applyStripeHeaders(dio);
        break;
      case DioType.paymobDio:
        _applyPaymobHeaders(dio);
        break;
    }

    _dioMap[type] = dio;
    return dio;
  }

  static void _applyCommonConfig(Dio dio) {
    const timeout = Duration(seconds: 30);
    dio.options
      ..connectTimeout = timeout
      ..receiveTimeout = timeout;

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  static Future<void> _applyDefaultHeaders(Dio dio) async {
    final token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static void _applyStripeHeaders(Dio dio) {
    dio.options.headers = {
      'Authorization': 'Bearer ${PaymentKeys.stripeSecretKey}',
      'Stripe-Version': '2023-08-16',
      'content-type': 'application/x-www-form-urlencoded',
    };
  }

  static void _applyPaymobHeaders(Dio dio) {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static Future<void> setTokenIntoHeaderAfterLogin(String token) async {
    final dio = _dioMap[DioType.defaultDio] ?? await getDio(DioType.defaultDio);
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

}


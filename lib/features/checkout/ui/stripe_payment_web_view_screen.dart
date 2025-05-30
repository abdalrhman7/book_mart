import 'package:book_mart/features/checkout/logic/payment_cubit/payment__cubit.dart';
import 'package:book_mart/features/checkout/ui/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewScreen extends StatefulWidget {
  final String paymentUrl;

  const PaymentWebViewScreen({super.key, required this.paymentUrl});

  @override
  _PaymentWebViewScreenState createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.paymentUrl))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
            _checkPaymentStatus(url);
          },
        ),
      );
  }

  void _checkPaymentStatus(String url) {
    if (!url.contains("post_pay")) return;

    final uri = Uri.parse(url);
    final isSuccess = uri.queryParameters['success'] == 'true';
    final txnCode = uri.queryParameters['txn_response_code'];

    if (isSuccess && txnCode == 'APPROVED') {
      context.read<PaymentCubit>().placeOrder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listenWhen: (previous, current) =>
      current is PlaceOrderSuccess || current is PlaceOrderFailure,
      listener: (context, state) {
        if (state is PlaceOrderSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const PaymentSuccessScreen()),
          );
        }
      },
      buildWhen: (previous, current) =>
      current is PlaceOrderLoading || current is PlaceOrderFailure || current is PlaceOrderSuccess,
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is PreparePaymobPaymentLoading,
          child: Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}



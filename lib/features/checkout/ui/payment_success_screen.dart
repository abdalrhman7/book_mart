import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.pushNamedAndRemoveUntil(
          Routes.bottomNavBar,
          predicate: (route) => false,
        );
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 100,
                color: Colors.green,
              ),
              verticalSpace(50),
              Text(
                "Your payment has been successfully completed!",
                style: TextStyles.font16BlackSemiBold,
                textAlign: TextAlign.center,
              ),
              verticalSpace(50),
              AppTextButton(
                buttonText: 'Go to Home',
                onPressed: () {
                  context.pushNamedAndRemoveUntil(Routes.bottomNavBar,
                      predicate: (route) => false);
                },
                buttonHeight: 16,
                verticalPadding: 4,
                buttonWidth: 180.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
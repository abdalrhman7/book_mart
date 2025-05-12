import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';




class AuthToggleText extends StatelessWidget {
  const AuthToggleText({super.key, required this.title, this.onTap, required this.subtitle});
  final String title ;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onTap!();
              },
            text: ' $subtitle',
            style: TextStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
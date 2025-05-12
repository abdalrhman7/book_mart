import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String? buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final BorderSide? borderSide;
  final bool isLoading;
  final bool isDisabled;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonText,
    this.textStyle,
    this.onPressed,
    this.borderSide,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool shouldDisable = isLoading || isDisabled;

    final Color effectiveBackgroundColor = shouldDisable
        ? (backgroundColor ?? ColorsManager.mainBinkColor).withOpacity(0.5)
        : (backgroundColor ?? ColorsManager.mainBinkColor);

    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            side: borderSide ?? BorderSide.none,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(effectiveBackgroundColor),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 52.h),
        ),
      ),
      onPressed: shouldDisable ? null : onPressed,
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2.5,
            )
          : Text(buttonText ?? '',
              style: textStyle ?? TextStyles.font16WhiteMedium),
    );
  }
}

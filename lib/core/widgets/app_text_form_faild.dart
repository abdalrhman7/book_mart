import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final bool readOnly ;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;


  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backGroundColor,
    this.controller,
    this.prefixIcon,
    this.validator,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.initialValue,
    this.readOnly = false,
     this.focusNode,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                   BorderSide(color: readOnly ? ColorsManager.lightGray : ColorsManager.mainBinkColor, width: 1.3),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: ColorsManager.lightGray, width: 1.3),
            ),
        errorBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1.3),
            ),
        focusedErrorBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1.3),
            ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: backGroundColor ?? ColorsManager.moreLightGray,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14BlackMedium,
      validator: (value) {
        return validator!(value);
      },
      maxLength: maxLength,
      textInputAction: textInputAction,
    );
  }
}

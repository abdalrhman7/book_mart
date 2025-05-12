import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/app_regex.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_form_faild.dart';
import 'package:book_mart/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:book_mart/features/auth/ui/sign_up/widgets/password_validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.tr(LocaleKeys.name), style: TextStyles.font16BlackSemiBold),
          verticalSpace(10),
          AppTextFormField(
            hintText: context.tr(LocaleKeys.nameHint),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr(LocaleKeys.invalidPasswordMessage);
              }
            },
            prefixIcon: const Icon(Icons.person_2_outlined),
            controller: cubit.nameController,
          ),
          verticalSpace(8),
          Text(context.tr(LocaleKeys.email), style: TextStyles.font16BlackSemiBold),
          verticalSpace(10),
          AppTextFormField(
            hintText: context.tr(LocaleKeys.emailHint),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return context.tr('invalidEmailMessage');
              }
            },
            prefixIcon: const Icon(Icons.email_outlined),
            controller: cubit.emailController,
          ),
          verticalSpace(8),
          Text(context.tr(LocaleKeys.password), style: TextStyles.font16BlackSemiBold),
          verticalSpace(10),
          AppTextFormField(
            hintText: context.tr(LocaleKeys.passwordHint),
            prefixIcon: const Icon(Icons.lock_outline),
            controller: cubit.passwordController,
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                return  context.tr(LocaleKeys.invalidPasswordMessage);
              }
            },
          ),
          verticalSpace(10),
          Text(context.tr(LocaleKeys.confirmPassword), style: TextStyles.font16BlackSemiBold),
          verticalSpace(10),
          AppTextFormField(
            hintText: context.tr(LocaleKeys.confirmPasswordHint),
            prefixIcon: const Icon(Icons.lock_outline),
            controller: cubit.confirmPasswordController,
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              return AppRegex.isConfirmPasswordValid(
                    cubit.passwordController.text,
                    value!,
                  )
                  ? null
                  : context.tr(LocaleKeys.passwordsDoNotMatchError);
            },
          ),
          verticalSpace(16),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

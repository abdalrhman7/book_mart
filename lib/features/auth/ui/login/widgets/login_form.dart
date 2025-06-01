import 'package:book_mart/core/helper/app_regex.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_form_faild.dart';
import 'package:book_mart/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/locale_keys.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  bool isPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(LocaleKeys.email),
            style: TextStyles.font16BlackSemiBold,
          ),
          verticalSpace(10),
          AppTextFormField(
            key: const Key('email_field'),
            hintText: context.tr(LocaleKeys.emailHint),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            prefixIcon: const Icon(Icons.email_outlined),
            controller: cubit.emailController,
          ),
          verticalSpace(8),
          Text(
            context.tr(LocaleKeys.password),
            style: TextStyles.font16BlackSemiBold,
          ),
          verticalSpace(10),
          AppTextFormField(
            key: const Key('password_field'),
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
              if (value == null || value.isEmpty) {
                return  context.tr(LocaleKeys.invalidPasswordMessage);
              }
            },
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}

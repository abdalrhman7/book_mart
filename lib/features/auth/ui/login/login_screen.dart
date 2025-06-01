import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/core/widgets/dont_have_account_text.dart';
import 'package:book_mart/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:book_mart/features/auth/ui/login/widgets/login_bloc_listener.dart';
import 'package:book_mart/features/auth/ui/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Text(
                  context.tr(LocaleKeys.loginNow),
                  style: TextStyles.font30BlackSemiBold,
                ),
                verticalSpace(6),
                Text(
                  context.tr(LocaleKeys.loginScreenTitle),
                  style: TextStyles.font12GrayRegular,
                ),
                verticalSpace(8),
                const LoginForm(),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.forgetPasswordScreen);
                  },
                  child: Text(
                    context.tr(LocaleKeys.forgotPassword),
                    style: TextStyles.font14BlackSemiBold,
                  ),
                ),
                verticalSpace(16),
                AppTextButton(
                  key: const Key('login_button'),
                  buttonText: context.tr(LocaleKeys.login),
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                ),
                verticalSpace(16),
                AuthToggleText(
                  onTap: () {
                    context.pushReplacementNamed(Routes.signUpScreen);
                  },
                  title: context.tr(LocaleKeys.dontHaveAccount),
                  subtitle: context.tr(LocaleKeys.registerNow),
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitLoginStates();
    }
  }
}
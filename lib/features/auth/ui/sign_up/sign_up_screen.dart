import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/core/widgets/dont_have_account_text.dart';
import 'package:book_mart/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:book_mart/features/auth/ui/sign_up/widgets/sign_up_bloc_listener.dart';
import 'package:book_mart/features/auth/ui/sign_up/widgets/sign_up_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  context.tr(LocaleKeys.registerNow),
                  style: TextStyles.font30BlackSemiBold,
                ),
                verticalSpace(6),
                Text(
                  context.tr(LocaleKeys.registerScreenTitle),
                  style: TextStyles.font12GrayRegular,
                ),
                verticalSpace(8),
                const SignUpForm(),
                verticalSpace(16),
                AppTextButton(
                  buttonText: context.tr(LocaleKeys.register),
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                ),
                verticalSpace(16),
                AuthToggleText(
                  onTap: () {
                    context.pushReplacementNamed(Routes.loginScreen);
                  },
                  title: context.tr(LocaleKeys.alreadyHaveAccount),
                  subtitle: context.tr(LocaleKeys.loginNow),
                ),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitSignupStates();
    }
  }
}

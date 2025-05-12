import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/core/widgets/app_text_form_faild.dart';
import 'package:book_mart/core/widgets/show_bar.dart';
import 'package:book_mart/features/auth/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ResetPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(context.tr(LocaleKeys.resetPassword))),
      body: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ResetPasswordLoading,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextFormField(
                    controller: context.read<ForgetPasswordCubit>().newPasswordController,
                    hintText: context.tr(LocaleKeys.newPassword),
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    controller: context.read<ForgetPasswordCubit>().confirmPasswordController,
                    hintText: context.tr(LocaleKeys.confirmPassword),
                  ),
                  const SizedBox(height: 20),
                  AppTextButton(
                    buttonText: context.tr(LocaleKeys.resetPassword),
                    textStyle: const TextStyle(color: Colors.white),
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      context.read<ForgetPasswordCubit>().resetPassword();
                    },
                  ),
                  BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                    listener: (context, state) {
                      if (state is ResetPasswordSuccess) {
                        showBar(context,context.tr(LocaleKeys.passwordResetSuccessfully));
                        context.pushNamedAndRemoveUntil(
                          Routes.loginScreen,
                          predicate: (Route<dynamic> route) => false,
                        );
                      }
                      if (state is ResetPasswordFailure) {
                        showBar(context, state.apiErrorModel.getAllErrorsMessages());
                      }
                    },
                    child: const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/app_regex.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/core/widgets/app_text_form_faild.dart';
import 'package:book_mart/core/widgets/show_bar.dart';
import 'package:book_mart/features/auth/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool _isResendEnabled = false;
  int _secondsRemaining = 60;
  Timer? _timer;

  void _startTimer() {
    setState(() {
      _secondsRemaining = 60;
      _isResendEnabled = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          } else {
            _isResendEnabled = false;
            _timer?.cancel();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr(LocaleKeys.forgotPassword),),),
      body: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SendOtpLoading || state is CheckOtpLoading,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextFormField(
                    controller: context.read<ForgetPasswordCubit>().emailController,
                    hintText: context.tr(LocaleKeys.emailHint),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return context.tr(LocaleKeys.enterValidEmail);
                      }
                    },
                  ),
                  verticalSpace(20),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: context.read<ForgetPasswordCubit>().codeController,
                    onChanged: (value) {},
                    autoDisposeControllers: false,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      inactiveColor: Colors.grey,
                      activeColor: Colors.blue,
                      borderWidth: .05,
                      fieldHeight: 55,
                      fieldWidth: 55,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return context.tr(LocaleKeys.enterValidCode);
                      }
                      return null;
                    },
                    onCompleted: (value) {
                      context.read<ForgetPasswordCubit>().checkOtp();
                    },
                  ),
                  verticalSpace(20),
                  AppTextButton(
                      buttonText: _isResendEnabled
                          ? context.tr(LocaleKeys.resendIn, args: ['$_secondsRemaining'])
                          : context.tr(LocaleKeys.sendCode),
                      textStyle: const TextStyle(color: Colors.white),
                      backgroundColor: _isResendEnabled ? Colors.grey : null,
                      onPressed: _isResendEnabled ? () {} : (){
                        _startTimer();
                        context.read<ForgetPasswordCubit>().sendOtp();
                      }
                  ),
                  verticalSpace(20),
                  const ForgetPasswordStateHandler()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ForgetPasswordStateHandler extends StatelessWidget {
  const ForgetPasswordStateHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          showBar(context, context.tr(LocaleKeys.codeSentSuccessfully));
        }
        if (state is SendOtpFailure) {
          showBar(context, state.apiErrorModel.getAllErrorsMessages());
        }
        if (state is CheckOtpSuccess) {
             context.pushNamed(Routes.resetPasswordScreen ,  arguments: context.read<ForgetPasswordCubit>());
        }
        if (state is CheckOtpFailure) {
          showBar(context, state.apiErrorModel.getAllErrorsMessages());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

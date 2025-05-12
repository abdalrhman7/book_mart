import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpFailure,
      listener: (context, state) async{
        if (state is SignUpFailure) {
          setupErrorState(context, state.apiErrorModel.getAllErrorsMessages());
        }
        if (state is SignUpSuccess) {
          await SharedPrefHelper.setData(SharedPrefKeys.isProfileComplete, false);

          showSuccessDialog(context);
        }
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBinkColor,
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                // primary: Colors.white,
                backgroundColor: Colors.blue,
                // onSurface: Colors.grey,
              ),
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.manageProfile , predicate: (route) => false);
              },
              child:  Text('Continue' , style: TextStyles.font13WhiteMedium,),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String errorMessage) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          errorMessage,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlackSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}

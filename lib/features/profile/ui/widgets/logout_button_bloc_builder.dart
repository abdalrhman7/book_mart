
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/features/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' ;

class LogoutButtonBlocBuilder extends StatelessWidget {
  const LogoutButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => current is LogoutLoading,
      builder: (context, state) {
        if (state is LogoutLoading) {
          return AppTextButton(
            buttonText: '',
            isLoading: true,
            onPressed: () {},
          );
        }
        return AppTextButton(
          buttonText: 'Logout',
          onPressed: () {
            context.read<ProfileCubit>().logout();
          },
        );
      },
    );
  }
}
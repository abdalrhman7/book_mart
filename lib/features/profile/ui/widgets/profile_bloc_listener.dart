import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/widgets/show_bar.dart';
import 'package:book_mart/features/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileBlocListener extends StatelessWidget {
  const ProfileBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) async {
        if (state is LogoutFailure) {
          showBar(context, state.apiErrorModel.getAllErrorsMessages());
        }
        if (state is LogoutSuccess) {
          Navigator.of(context, rootNavigator: true)
              .pushNamedAndRemoveUntil(
            Routes.loginScreen,
                (Route<dynamic> route) => false,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

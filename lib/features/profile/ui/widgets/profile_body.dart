import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/features/profile/logic/profile_cubit.dart';
import 'package:book_mart/features/profile/ui/widgets/profile_bloc_listener.dart';
import 'package:book_mart/features/profile/ui/widgets/profile_image_widget.dart';
import 'package:book_mart/features/profile/ui/widgets/profile_info_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logout_button_bloc_builder.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is GetUserDataLoading || current is GetUserDataSuccess,
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetUserDataSuccess) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  verticalSpace(20),
                   ProfileImageWidget(
                    imageUrl: state.user.image,
                  ),
                  verticalSpace(20),
                   ProfileInfoField(
                    label: context.tr(LocaleKeys.name),
                    value: state.user.name!,
                  ),
                  verticalSpace(16),
                   ProfileInfoField(
                    label: context.tr(LocaleKeys.email),
                    value: state.user.email ?? context.tr(LocaleKeys.updateYourEmail),
                  ),
                  verticalSpace(16),
                   ProfileInfoField(
                    label: context.tr(LocaleKeys.phone),
                    value: state.user.phone ?? context.tr(LocaleKeys.updateYourPhone),
                  ),
                  verticalSpace(16),
                   ProfileInfoField(
                    label: context.tr(LocaleKeys.address),
                    value: state.user.address ?? context.tr(LocaleKeys.updateYourAddress),
                  ),
                  verticalSpace(16),
                   ProfileInfoField(
                    label: context.tr(LocaleKeys.city),
                    value: state.user.city ?? context.tr(LocaleKeys.updateYourCity),
                  ),
                  verticalSpace(24),
                  AppTextButton(buttonText: context.tr(LocaleKeys.editProfile), onPressed: () async {
                   var result = await context.pushNamed(Routes.manageProfile ,arguments: state.user);
                   if (result == true) {
                     context.read<ProfileCubit>().getUserData();
                   }
                  }, backgroundColor: Colors.blue,),
                  verticalSpace(16),
                  const LogoutButtonBlocBuilder(),
                  verticalSpace(16),
                  const ProfileBlocListener()
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}




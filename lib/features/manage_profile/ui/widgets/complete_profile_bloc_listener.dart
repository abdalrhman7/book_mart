import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/widgets/show_bar.dart';
import 'package:book_mart/features/manage_profile/logic/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';

class CompleteProfileBlocListener extends StatelessWidget {
  const CompleteProfileBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompleteProfileCubit, CompleteProfileState>(
      listener: (context, state) async{
        if (state is ImagePickedSuccess) {
          showBar(context, 'Image Picked Successfully');
        }
        if (state is CompleteProfileSuccess) {
          showBar(context, 'Profile Completed Successfully');
          await SharedPrefHelper.setData(SharedPrefKeys.isProfileComplete, true);
          context.pushNamedAndRemoveUntil(Routes.bottomNavBar,
              predicate: (route) => false);
        }
        if (state is UpdateProfileSuccess) {
          showBar(context, 'Profile Updated Successfully');
          Navigator.pop(context , true);

        }
        if (state is CompleteProfileFailure) {
          showBar(
              context,
              state.apiErrorModel.getAllErrorsMessages());
        }
      },
      child: SizedBox(
        height: 8.h,
      ),
    );
  }
}

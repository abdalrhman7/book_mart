import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/manage_profile/logic/complete_profile_cubit.dart';
import 'package:book_mart/features/manage_profile/ui/widgets/complete_profile_bloc_listener.dart';
import 'package:book_mart/features/manage_profile/ui/widgets/complete_profile_form_data.dart';
import 'package:book_mart/features/manage_profile/ui/widgets/pick_image_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ManageProfileScreen extends StatelessWidget {
  const ManageProfileScreen({super.key, this.user});
  final User? user ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(user != null ? 'Update Profile' : 'Complete Profile') , centerTitle: true,),
      body: BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is CompleteProfileLoading,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    spacing: 14.h,
                    children: [
                       PickImageBlocBuilder(imgUrl: user?.image,),
                       CompleteProfileFormData( user: user,),
                      AppTextButton(
                        buttonText: 'Submit',
                        textStyle: TextStyles.font16WhiteMedium,
                        backgroundColor: ColorsManager.mainBinkColor,
                        onPressed: () {
                          validateThenDoCompleteProfile(context , user != null);
                        },
                      ),
                      const CompleteProfileBlocListener(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void validateThenDoCompleteProfile(BuildContext context , bool? isUpdateProfile) {
    var cubit = context.read<CompleteProfileCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitCompleteProfileStates(isUpdateProfile);
    }
  }
}





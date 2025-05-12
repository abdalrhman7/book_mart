import 'package:book_mart/core/widgets/app_text_form_faild.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/manage_profile/logic/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteProfileFormData extends StatefulWidget {
  const CompleteProfileFormData({super.key, this.user});
  final User? user;

  @override
  State<CompleteProfileFormData> createState() => _CompleteProfileFormDataState();
}

class _CompleteProfileFormDataState extends State<CompleteProfileFormData> {
  @override
  void initState() {
    print('widget.user?.name : ${widget.user?.name}');
    var cubit = context.read<CompleteProfileCubit>();
    cubit.nameController.text = widget.user?.name ?? '';
    cubit.addressController.text = widget.user?.address ?? '';
    cubit.cityController.text = widget.user?.city ?? '';
    cubit.phoneController.text = widget.user?.phone ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CompleteProfileCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
          spacing: 14.h,
          children: [
            AppTextFormField(
              controller: cubit.nameController,
              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            AppTextFormField(
              controller: cubit.addressController,
              hintText: 'Address',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            AppTextFormField(
              controller: cubit.cityController,
              hintText: 'City',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
            ),
            AppTextFormField(
              controller: cubit.phoneController,
              hintText: 'Phone',
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
          ]
      ),
    );
  }
}
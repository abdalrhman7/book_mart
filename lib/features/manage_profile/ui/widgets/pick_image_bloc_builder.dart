import 'dart:io';
import 'package:book_mart/features/manage_profile/logic/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickImageBlocBuilder extends StatelessWidget {
  const PickImageBlocBuilder({
    super.key, this.imgUrl,
  });
  final String? imgUrl ;


  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CompleteProfileCubit>();

    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      buildWhen: (previous, current) =>
      current is ImagePickedSuccess,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            cubit.pickImage();
          },
          child: CircleAvatar(
            radius: 50,
            backgroundImage: cubit.file != null
                ? FileImage(File(cubit.file!.path))
                : imgUrl != null ? NetworkImage(imgUrl ?? '') : null,
            child: cubit.file == null
                ?  Icon(Icons.camera_alt, size: 50 , color:Colors.white.withOpacity(0.6))
                : null,
          ),
        );
      },
    );
  }
}

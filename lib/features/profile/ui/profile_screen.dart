import 'package:book_mart/core/di/dependency_injection.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/change_lang_button.dart';
import 'package:book_mart/features/profile/data/repo/profile_repo.dart';
import 'package:book_mart/features/profile/logic/profile_cubit.dart';
import 'package:book_mart/features/profile/ui/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: TextStyles.font18BlackSemiBold,),
        actions: [
          const ChangeLangButton(),
          horizontalSpace(8),
        ],
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(getIt<ProfileRepo>())..getUserData(),
        child: const ProfileBody(),
      ),
    );
  }
}




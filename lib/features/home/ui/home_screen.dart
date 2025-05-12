import 'package:book_mart/core/di/dependency_injection.dart';
import 'package:book_mart/core/widgets/custom_app_bar.dart';
import 'package:book_mart/features/home/data/repo/home_repo.dart';
import 'package:book_mart/features/home/logic/home_cubit.dart';
import 'package:book_mart/features/home/logic/search_cubit/search_cubit.dart';
import 'package:book_mart/features/home/ui/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' ;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit(getIt<HomeRepo>())..initializeHome(),
            ),
            BlocProvider(
              create: (context) => SearchCubit(getIt<HomeRepo>()),
            ),
          ],
          child: const HomeScreenBody(),
        ),
      ),
    );
  }
}





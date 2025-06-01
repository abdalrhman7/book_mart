import 'package:book_mart/features/auth/data/repo/auth_repo.dart';
import 'package:book_mart/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'mock_routes.dart';


Widget makeTestableWidget({
  required Widget child,
  required AuthRepo mockRepo,
}) {
  return EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    startLocale: const Locale('en'),
    child: ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: BlocProvider<LoginCubit>(
            create: (_) => LoginCubit(mockRepo),
            child: child,
          ),
          routes: mockRoutes
        );
      },
    ),
  );
}

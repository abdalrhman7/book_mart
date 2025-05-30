import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/theming/colors.dart';

class BookMart extends StatelessWidget {
  final AppRouter appRouter;
  const BookMart({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Book Mart',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBinkColor,
          scaffoldBackgroundColor: ColorsManager.appBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorsManager.appBackgroundColor,
            centerTitle: true,
          ),
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
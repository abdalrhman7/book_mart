import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/di/dependency_injection.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/auth/data/repo/auth_repo.dart';
import 'package:book_mart/features/auth/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:book_mart/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:book_mart/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:book_mart/features/auth/ui/forget_password/forget_password_screen.dart';
import 'package:book_mart/features/auth/ui/forget_password/reset_password_screen.dart';
import 'package:book_mart/features/auth/ui/login/login_screen.dart';
import 'package:book_mart/features/auth/ui/sign_up/sign_up_screen.dart';
import 'package:book_mart/features/bottom_nav_bar/logic/bottom_nav_bar_cubit.dart';
import 'package:book_mart/features/bottom_nav_bar/ui/bottom_nav_bar.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:book_mart/features/checkout/logic/payment_cubit/payment__cubit.dart';
import 'package:book_mart/features/checkout/ui/stripe_payment_web_view_screen.dart';
import 'package:book_mart/features/manage_profile/data/repo/complete_profile_repo.dart';
import 'package:book_mart/features/manage_profile/logic/complete_profile_cubit.dart';
import 'package:book_mart/features/manage_profile/ui/manage_profile_screen.dart';
import 'package:book_mart/features/onboarding/ui/onboarding_screen.dart';
import 'package:book_mart/features/product_details_screen/ui/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final dynamic arguments = settings.arguments;

    // Handle deep links to product: parse URI,
    // then guard by login and profile completion before showing details
    if (name != null) {
      final uri = Uri.tryParse(name);
      if (uri != null &&
          uri.pathSegments.isNotEmpty &&
          uri.pathSegments[0] == 'product' &&
          uri.pathSegments.length >= 2) {
        if (!AppConstants.isLoggedInUser) {
          return _loginRoute();
        }

        bool isProfileComplete =
            SharedPrefHelper.getBool(SharedPrefKeys.isProfileComplete);
        if (!isProfileComplete) {
          return _manageProfileRoute();
        }

        final id = int.tryParse(uri.pathSegments[1]);
        if (id != null) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: getIt<CartCubit>(),
              child: ProductDetailsScreen(bookId: id),
            ),
          );
        }
      }
    }

    // Initial route logic: use '/' or null to decide onboarding
    // → login → profile completion → main app
    if (name == '/' || name == null) {
      final bool isOnBoardingSeen =
          SharedPrefHelper.getBool(SharedPrefKeys.isOnBoardingSeen);

      final bool isLoggedInUser = AppConstants.isLoggedInUser;

      final bool isProfileComplete =
          SharedPrefHelper.getBool(SharedPrefKeys.isProfileComplete);

      if (!isOnBoardingSeen) {
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      }

      if (!isLoggedInUser) {
        return _loginRoute();
      }

      if (!isProfileComplete) {
        return _manageProfileRoute();
      }

      return _bottomNavRoute();
    }

    // Named routes: handle all other screens by their route names
    switch (name) {
      case Routes.loginScreen:
        return _loginRoute();
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SignUpCubit(getIt<AuthRepo>()),
            child: const SignUpScreen(),
          ),
        );

      case Routes.bottomNavBar:
        return _bottomNavRoute();

      case Routes.productDetailsScreen:
        final int bookId = arguments as int;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(bookId: bookId),
        );

      case Routes.paymentWebViewScreen:
        return MaterialPageRoute(
          builder: (context) {
            var args = settings.arguments as Map<String, dynamic>;
            return BlocProvider.value(
              value: args['cubit'] as PaymentCubit,
              child: PaymentWebViewScreen(
                paymentUrl: args['url'],
              ),
            );
          },
        );

      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) {
            return const OnboardingScreen();
          },
        );

      case Routes.manageProfile:
        final User? userArg = arguments as User?;
        return _manageProfileRoute(userArg);

      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => ForgetPasswordCubit(getIt<AuthRepo>()),
              child: const ForgetPasswordScreen(),
            );
          },
        );

      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) {
            var args = settings.arguments as ForgetPasswordCubit;
            return BlocProvider.value(
              value: args,
              child: const ResetPasswordScreen(),
            );
          },
        );

      default:
        return null;
    }
  }

  MaterialPageRoute _loginRoute() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => LoginCubit(getIt<AuthRepo>()),
        child: const LoginScreen(),
      ),
    );
  }

  MaterialPageRoute _bottomNavRoute() {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<CartCubit>()..getCart()),
          BlocProvider(create: (_) => BottomNavBarCubit()),
        ],
        child: const BottomNavbar(),
      ),
    );
  }

  MaterialPageRoute _manageProfileRoute([User? user]) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => CompleteProfileCubit(getIt<CompleteProfileRepo>()),
        child: ManageProfileScreen(user: user),
      ),
    );
  }
}

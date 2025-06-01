import 'package:book_mart/core/routing/routes.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> mockRoutes = {
  Routes.bottomNavBar: (context) => const Scaffold(
        body: Center(child: Text('Mock BottomNavBar')),
      ),
  Routes.onboarding: (context) => const Scaffold(
        body: Center(child: Text('Mock Onboarding')),
      ),
  Routes.manageProfile: (context) => const Scaffold(
        body: Center(child: Text('Mock Manage Profile')),
      ),
  Routes.productDetailsScreen: (context) => const Scaffold(
        body: Center(child: Text('Mock Product Details')),
      ),
  Routes.loginScreen: (context) => const Scaffold(
        body: Center(child: Text('Mock Login')),
      ),
  Routes.signUpScreen: (context) => const Scaffold(
        body: Center(child: Text('Mock Sign Up')),
      ),
  Routes.forgetPasswordScreen: (context) => const Scaffold(
        body: Center(child: Text('Mock Forget Password')),
      ),
  Routes.resetPasswordScreen: (context) => const Scaffold(
        body: Center(child: Text('Mock Reset Password')),
      ),
  Routes.paymentWebViewScreen: (context) => const Scaffold(
        body: Center(child: Text('Mock Payment WebView')),
      ),
};

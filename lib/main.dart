import 'dart:ui';

import 'package:book_mart/book_mart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:book_mart/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/payment_keys.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper/app_initializer.dart';
import 'core/helper/custom_bloc_observer.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeApp();
  Stripe.publishableKey = PaymentKeys.stripePublishableKey;
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: BookMart(appRouter: AppRouter()),
    ),
  );
}

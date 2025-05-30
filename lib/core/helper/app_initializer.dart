import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import 'notification-helper/firebase_notification.dart';

Future<void> initializeApp() async {
  await Future.wait([
    dotenv.load(fileName: ".env"),
    SharedPrefHelper.init(),
    ScreenUtil.ensureScreenSize(),
    EasyLocalization.ensureInitialized(),
    checkIfLoggedInUser(),

    NotificationService.instance.initialize(),
  ]);
}

Future<void> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  print('userToken : $userToken');
  if (userToken.isNullOrEmpty()) {
    AppConstants.isLoggedInUser = false;
  } else {
    AppConstants.isLoggedInUser = true;
  }
  print('isLoggedInUser : ${AppConstants.isLoggedInUser}');
}


import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title , bool showBackButton = true , bool showNotification = true}) {
  return AppBar(
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title:  Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.font18BlackBold,
    ),
  );
}
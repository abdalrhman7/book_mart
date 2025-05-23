import 'package:flutter/material.dart';

void showBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration:  const Duration(milliseconds: 1000),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ),
  );
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

void ShowCustomSnackbar({
  required String title,
  required String message,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
  int durationInSeconds = 3,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    colorText: textColor,
    borderRadius: 20,
    margin: EdgeInsets.all(10),
    duration: Duration(seconds: durationInSeconds),
    isDismissible: true,
    snackStyle: SnackStyle.FLOATING,
  );
}

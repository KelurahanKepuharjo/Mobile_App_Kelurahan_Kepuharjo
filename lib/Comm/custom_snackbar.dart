import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

ShowSnackBar(title, message, type) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: type == 'error' ? Colors.red : Colors.green,
    colorText: whiteColor,
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbar(
  title,
  message,
) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey.shade300,
      colorText: Colors.black);
}

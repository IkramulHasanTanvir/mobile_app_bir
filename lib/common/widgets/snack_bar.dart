import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBar(
    {required String title,
    required String content,
    required Color actionColor}) {
  Get.snackbar(title, content,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white.withOpacity(0.8),
      colorText: Colors.black,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: actionColor);
}

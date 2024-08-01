import 'package:flutter/material.dart';
import 'package:get/get.dart';

void succesMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(
      Icons.check_circle_rounded,
      color: Colors.green,
    ),
  );
}

void errorMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(
      Icons.error_rounded,
      color: Colors.red,
    ),
  );
}

void adviseMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(
      Icons.warning_rounded,
      color: Colors.amber,
    ),
  );
}

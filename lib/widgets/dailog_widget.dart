import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailogWidget {
  static showDailog(String message) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: "Welcome to Flutter Dev'S",
      content: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          message,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.black, fontSize: 20),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Alert {
  static void show(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      message: message,
      duration: Duration(seconds: 5),
    )..show(context);
  }
}

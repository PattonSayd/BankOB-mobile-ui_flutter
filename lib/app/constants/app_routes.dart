import 'package:flutter/material.dart';

class AppRoutes {
  static void to(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void off(context, page) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static void offAll(context, page) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (route) => route.isCurrent);
  }

  static void back(context) {
    Navigator.pop(context);
  }
}

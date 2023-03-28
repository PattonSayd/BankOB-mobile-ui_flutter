import 'package:flutter/material.dart';

class AppShadow {
  static Shadow get addCardTextShadow => const Shadow(
        offset: Offset(0.3, 0.5),
        blurRadius: 3.0,
        color: Color.fromRGBO(0, 0, 0, 0.25),
      );

  static BoxShadow get buttonsBackgroundShadow => const BoxShadow(
        blurRadius: 16,
        spreadRadius: 4,
        offset: Offset(0, -2),
        color: Color.fromRGBO(224, 226, 230, 0.5),
      );
}

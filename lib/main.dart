import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}
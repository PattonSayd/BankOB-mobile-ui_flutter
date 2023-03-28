import 'package:flutter/material.dart';

class OptionsItemModel {
  String itemText;
  String itemIcon;
  final VoidCallback itemTap;

  OptionsItemModel({
    required this.itemText,
    required this.itemIcon,
    required this.itemTap,
  });
}

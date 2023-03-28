import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class GlobalCheckBox extends StatefulWidget {
  const GlobalCheckBox({super.key});

  @override
  State<GlobalCheckBox> createState() => _GlobalCheckBoxState();
}

class _GlobalCheckBoxState extends State<GlobalCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      activeColor: AppColors.instance.primaryColor,
      shape: context.roundedRectangleBorderAll3,
      side: isChecked
          ? null
          : BorderSide(
              color: AppColors.instance.primaryColor,
              width: 1.6,
            ),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

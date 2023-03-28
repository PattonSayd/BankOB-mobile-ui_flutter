import 'package:bank_of_baku_app/app/styles/app_button_styles.dart';
import 'package:bank_of_baku_app/app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GlobalTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonTap;

  const GlobalTextButton({
    Key? key,
    required this.buttonText,
    required this.buttonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: AppButtonStyles.kGlobalTextButtonStyle(context),
      onPressed: buttonTap,
      child: Text(
        buttonText,
        style: AppTextStyles.kTextButtonTextStyle,
        strutStyle: StrutStyle(leading: 0.25, fontSize: 17.95.sp),
      ),
    );
  }
}

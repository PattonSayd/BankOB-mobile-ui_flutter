import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/styles/app_button_styles.dart';
import '../../app/styles/app_text_styles.dart';

class GlobalButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? buttonTap;
  final bool? showBorder;
  const GlobalButton({
    Key? key,
    required this.buttonText,
    this.buttonTap,
    this.showBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppButtonStyles.kGlobalButtonStyle(context, showBorder),
      onPressed: buttonTap,
      child: Text(
        buttonText,
        style: AppTextStyles.kButtonTextStyle,
        strutStyle: StrutStyle(leading: 0.25, fontSize: 17.95.sp),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../app/extensions/context_extension.dart';
import '../../app/styles/app_box_decorations.dart';
import '../../app/styles/app_text_styles.dart';

class GlobalOtpField extends StatelessWidget {
  final TextEditingController otpFieldController;
  final FocusNode otpFieldFocus;
  final int otpFieldLength;
  final void Function(String) otpOnChanged;

  const GlobalOtpField({
    Key? key,
    required this.otpFieldController,
    required this.otpFieldFocus,
    required this.otpFieldLength,
    required this.otpOnChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: otpFieldController,
      focusNode: otpFieldFocus,
      length: otpFieldLength,
      obscureText: false,
      animationType: AnimationType.scale,
      showCursor: false,
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      errorTextSpace: 0,
      autoFocus: true,
      autoUnfocus: false,
      autoDismissKeyboard: false,
      autoDisposeControllers: false,
      keyboardType: TextInputType.number,
      pinTheme: AppBoxDecorations.kOtpFieldDecorationTheme(context),
      textStyle: AppTextStyles.kOtpFieldTextStyle,
      pastedTextStyle: AppTextStyles.kOtpFieldTextStyle,
      mainAxisAlignment: MainAxisAlignment.start,
      animationDuration: context.durationMSec300,
      onChanged: otpOnChanged,
    );
  }
}

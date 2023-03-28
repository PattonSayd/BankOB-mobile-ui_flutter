import 'dart:async';

import 'package:bank_of_baku_app/app/constants/app_routes.dart';
import 'package:bank_of_baku_app/presentation/screens/lock/lock_screen.dart';

import '../../widgets/global_button.dart';
import '../../widgets/global_empty_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/extensions/context_extension.dart';
import '../../../app/styles/app_box_decorations.dart';
import '../../../app/styles/app_text_styles.dart';
import '../../widgets/global_appbar.dart';
import '../../widgets/global_otp_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late AppLocalizations appLocalizations;
  late final TextEditingController otpFieldController;
  late final FocusNode otpFieldFocus;
  late Timer _timer;
  int _start = 30;

  @override
  void initState() {
    super.initState();
    otpFieldController = TextEditingController();
    otpFieldFocus = FocusNode();
    startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    otpFieldController.dispose();
    otpFieldFocus.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: GlobalAppBar(titleText: appLocalizations.otpCode),
        body: Padding(
          padding: context.paddingHorizontal16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.68.h), //remark
              _buildOtpMessageText,
              SizedBox(height: 4.21.h), //remark
              _buildTimeRemainderText,
              SizedBox(height: 2.63.h), //remark
              GlobalOtpField(
                otpFieldController: otpFieldController,
                otpFieldFocus: otpFieldFocus,
                otpFieldLength: 6, //remark
                otpOnChanged: (value) {},
              ),
              SizedBox(height: 2.63.h), //remark
              _buildGetSmsText,
              SizedBox(height: 0.52.h), //remark
              _buildSendAgainText,
              const GlobalEmptySize(),
              GlobalButton(
                buttonText: appLocalizations.continueButton,
                buttonTap: () {
                  FocusScope.of(context).unfocus();
                  AppRoutes.to(context, const LockScreen());
                },
              ),
              SizedBox(height: 2.63.h),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget get _buildOtpMessageText => Text(
        appLocalizations.otpMessage,
        style: AppTextStyles.kOtpSentMessageTextStyle,
      );

  Widget get _buildTimeRemainderText => RichText(
        text: TextSpan(
          style: AppTextStyles.kTimeRemainderTextStyle(),
          children: [
            TextSpan(text: appLocalizations.remainingTime),
            TextSpan(
                text: '$_start s.',
                style: AppTextStyles.kTimeRemainderTextStyle(isTime: true)),
          ],
        ),
      );

  Widget get _buildGetSmsText => Text(
        appLocalizations.getSms,
        style: AppTextStyles.kGetSmsTextStyle(),
      );

  Widget get _buildSendAgainText => Text(
        appLocalizations.sendAgain,
        style: AppTextStyles.kSendAgainTextStyle(),
      );
}

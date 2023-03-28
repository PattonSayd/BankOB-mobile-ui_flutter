import 'package:bank_of_baku_app/app/constants/app_routes.dart';
import 'package:bank_of_baku_app/presentation/screens/forgot/forgot_pin_screen.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/global/global_bottom_sheet.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../congratulations/congratulations_screen.dart';
import 'dot_indicator_widget.dart';
import 'mini_header_text_widget.dart';
import 'number_item_widget.dart';

class PinCodeWidget extends StatefulWidget {
  final int maxDotLength;
  const PinCodeWidget({
    Key? key,
    required this.maxDotLength,
  }) : super(key: key);

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  int countTap = 0;
  List activeDotList = [];
  late AppLocalizations appLocalizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DotIndicatorWidget(
            dotLength: widget.maxDotLength, activeDotList: activeDotList),
        SizedBox(height: 3.16.h),
        Container(
          decoration: AppBoxDecorations.kPinCodeBackgroundDecoration(context),
          child: Column(
            children: [
              _buildPinCodeItems,
              SizedBox(height: 4.4.h),
              _buildTexts,
              SizedBox(height: 4.21.h), //remark
            ],
          ),
        ),
      ],
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount get _pinGridDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 12.h,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      );

  Widget get _buildPinCodeItems => GridView.builder(
        itemCount: 12,
        shrinkWrap: true,
        padding:
            EdgeInsets.only(top: 2.75.h, left: 0.92.h, right: 0.92.h), //remark
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: _pinGridDelegate,
        itemBuilder: (context, index) => PinCodeItemWidget(
          onTap: () => onTapPinItem(index),
          index: index,
        ),
      );

  Widget get _buildTexts => Padding(
        padding: context.paddingHorizontal28,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                AppRoutes.to(context, const ForgotPinScreen());
              },
              child: Text(appLocalizations.forgotPinQuestion,
                  style: AppTextStyles.kForgotPasswordTextStyle),
            ),
            GestureDetector(
              onTap: () {
                GlobalBottomSheet.showGlobalModal(context,
                    child: _buildAreYouSureLogout);
              },
              child: Text(appLocalizations.logout,
                  style: AppTextStyles.kLogoutTextStyle),
            ),
          ],
        ),
      );

  Widget get _buildAreYouSureLogout => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MiniHeaderTextWidget(miniHeaderText: appLocalizations.exitAppText),
          SizedBox(height: 2.63.h),
          Text(
            appLocalizations.sureToExitAppText,
            style: AppTextStyles.kAreYouSureLogoutTextStyle(),
          ),
          SizedBox(height: 3.16.h),
          GlobalButton(
            buttonText: appLocalizations.confirm,
            buttonTap: () {
              AppRoutes.back(context);
              AppRoutes.to(context, const CongratulationsScreen());
            },
          ),
          SizedBox(height: 1.05.h),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                AppRoutes.back(context);
              },
              child: Text(
                appLocalizations.close,
                style: AppTextStyles.kButtonTextStyle,
              ),
            ),
          ),
          SizedBox(height: 2.h),
        ],
      );

  void onTapPinItem(int index) {
    switch (index) {
      case 11:
        removeNumber();
        break;
      case 9:
        showFingerprintBottomSheet();
        break;
      default:
        addNumber();
    }
  }

  void removeNumber() {
    if (activeDotList.isNotEmpty) {
      debugPrint('removed'); //show console
      activeDotList.removeLast();
      countTap--;
      setState(() {});
    }
  }

  void addNumber() {
    if (activeDotList.length < widget.maxDotLength) {
      debugPrint('added'); //show console
      activeDotList.add(countTap);
      countTap++;
      setState(() {});
    }
  }

  void showFingerprintBottomSheet() {
    GlobalBottomSheet.showGlobalModal(context,
        child: _buildFingerprintBottomSheetBody);
  }

  Widget get _buildFingerprintBottomSheetBody => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MiniHeaderTextWidget(
              miniHeaderText: appLocalizations.confirmFingerprint),
          SizedBox(height: 5.21.h),
          _buildFingerprint,
          SizedBox(height: 8.42.h),
          GestureDetector(
            onTap: () => AppRoutes.back(context),
            child: Padding(
              padding: context.paddingOnlyLeft(1.6.h),
              child: Text(appLocalizations.notNow,
                  style: AppTextStyles.kNotNowTextStyle()),
            ),
          ),
          SizedBox(height: 4.21.h),
        ],
      );

  Widget get _buildFingerprint => Center(
        child: Column(
          children: [
            SvgPicture.asset(
              AppAssets.fingerprint,
              height: 7.9.h,
              width: 7.9.h,
            ),
            SizedBox(height: 2.63.h),
            Text(appLocalizations.touchFingerprint,
                style: AppTextStyles.kTouchFingerprintSensorTextStyle),
          ],
        ),
      );
}

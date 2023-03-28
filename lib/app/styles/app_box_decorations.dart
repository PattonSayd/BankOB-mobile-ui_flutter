import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_assets.dart';
import '../extensions/context_extension.dart';
import '../themes/app_colors.dart';

class AppBoxDecorations {
  static BoxDecoration kScaffoldDecoration(BuildContext context) =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: const FractionalOffset(93.75, 406.5),
          end: const FractionalOffset(281.25, 406.5),
          stops: const [0, 1],
          colors: AppColors.instance.scaffoldGradientColors,
        ),
      );

  static BoxDecoration kBottomPanelDecoration(BuildContext context) =>
      BoxDecoration(
        borderRadius: context.borderRadiusTop28,
        gradient: LinearGradient(
          begin: const FractionalOffset(93.75, 193.247),
          end: const FractionalOffset(281.25, 193.247),
          stops: const [0, 1],
          colors: AppColors.instance.bottomPanelColor,
        ),
      );

  static BoxDecoration get kImageBackgroundDecoration => BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.background),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        gradient: LinearGradient(
          begin: const FractionalOffset(93.75, 30.5),
          end: const FractionalOffset(281.25, 30.5),
          stops: const [0, 0.517, 1],
          colors: AppColors.instance.backgroundImageGradientColors,
        ),
      );

  static BoxDecoration kOptionsItemDecoration(BuildContext context) =>
      BoxDecoration(
        color: AppColors.instance.optionBoxColor,
        borderRadius: context.borderRadiusAll12,
      );

  static PinTheme kOtpFieldDecorationTheme(BuildContext context) => PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: context.borderRadiusAll8,
        fieldHeight: 5.8.h,
        fieldWidth: 11.2.w,
        inactiveColor: AppColors.instance.otpFieldColor,
        selectedColor: AppColors.instance.primaryColor,
        activeColor: AppColors.instance.otpFieldColor,
        activeFillColor: AppColors.instance.otpFieldColor,
        inactiveFillColor: AppColors.instance.otpFieldColor,
        selectedFillColor: AppColors.instance.otpFieldColor,
        fieldOuterPadding: context.paddingOnlyRight(1.58.h),
        borderWidth: 1,
      );

  static BoxDecoration kDotIndicatorDecoration(bool isPinEnter) =>
      BoxDecoration(
        color: isPinEnter
            ? AppColors.instance.dotIndicatorActiveColor
            : AppColors.instance.dotIndicatorInactiveColor,
        shape: BoxShape.circle,
      );

  static BoxDecoration kPinCodeBackgroundDecoration(BuildContext context) =>
      BoxDecoration(
        color: AppColors.instance.pinCodeBackgroundColor,
        borderRadius: context.borderRadiusTop28,
      );

  static BoxDecoration kMiniCardDecoration(
          BuildContext context, String image) =>
      BoxDecoration(
        borderRadius: context.borderRadiusAll16,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      );

  static BoxDecoration kTabBarDecoration(BuildContext context, bool isActive) =>
      BoxDecoration(
        borderRadius: context.borderRadiusAll8,
        color: isActive ? AppColors.instance.cardColor : Colors.transparent,
      );

  static BoxDecoration kMainBackgroundDecoration(BuildContext context) =>
      BoxDecoration(
        color: AppColors.instance.cardColor,
        borderRadius: context.borderRadiusTop24,
      );

  static BoxDecoration kBonusBoxDecoration(BuildContext context) =>
      BoxDecoration(
        color: AppColors.instance.bonusBoxColor,
        borderRadius: context.borderRadiusAll12,
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: AppColors.instance.bonusBoxBorderColor,
        ),
      );

  static BoxDecoration kTopPickBoxDecoration(BuildContext context) =>
      BoxDecoration(
        color: AppColors.instance.topPickBoxColor,
        borderRadius: context.borderRadiusAll12,
      );

  static BoxDecoration kForYouBoxDecoration(BuildContext context) =>
      BoxDecoration(
        color: AppColors.instance.forYouBoxColor,
        borderRadius: context.borderRadiusAll12,
      );

  static BoxDecoration get kBottomNavBarBoxDecoration => BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: AppColors.instance.bottomNavBarBorderColor,
          ),
        ),
      );

  static BoxDecoration kSliderFieldBoxDecoration(BuildContext context) =>
      BoxDecoration(
        color: AppColors.instance.inputColor,
        borderRadius: context.borderRadiusAll8,
        border: Border.all(
          color: AppColors.instance.borderInactiveColor,
        ),
      );

  static BoxDecoration get kMainCardBoxDecoration => BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.mainCard),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      );

  static BoxDecoration kRadioButtonWithBoxDecoration(BuildContext context) =>
      BoxDecoration(
        borderRadius: context.borderRadiusAll8,
        color: AppColors.instance.cardColor,
        border: Border.all(
          width: 1,
          color: AppColors.instance.radioBoxBorderColor,
          style: BorderStyle.solid,
        ),
      );

  static BoxDecoration get kCvvBoxDecoration => BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        gradient: LinearGradient(
          colors: AppColors.instance.cvvGradientColors,
        ),
      );
}

import 'package:bank_of_baku_app/app/styles/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../themes/app_colors.dart';

class AppTextStyles {
  static TextStyle get kInputTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.15,
      );

  static TextStyle get kLabelTextStyle => TextStyle(
        color: AppColors.instance.textLabelColor,
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.15,
      );

  static TextStyle get kFloatingLabelStyle => TextStyle(
        color: AppColors.instance.textLabelColor,
        fontSize: 15.85.sp, //12-px to 14 px
        fontWeight: FontWeight.w400,
      );

  static TextStyle get kHeaderTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 20.75.sp, //24-px
        fontWeight: FontWeight.w600,
      );

  static TextStyle get kCongratulateTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 22.41.sp, //28-px
        fontWeight: FontWeight.w600,
      );

  static TextStyle get kRegisterTitleTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 20.75.sp, //28-px
        fontWeight: FontWeight.w600,
      );

  static TextStyle get kForgotPasswordTextStyle => TextStyle(
        color: AppColors.instance.primaryColor,
        fontSize: 15.85.sp, //14-px
        fontWeight: FontWeight.w500,
      );

  static TextStyle get kButtonTextStyle => TextStyle(
        fontSize: 17.95.sp, //18-px
        fontWeight: FontWeight.w500,
      );

  static TextStyle get kLanguageTextStyle => TextStyle(
        fontSize: 16.95.sp, //16-px
        color: AppColors.instance.textBlackColor,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.31,
      );

  static TextStyle get kOptionsItemTextStyle => TextStyle(
        // fontSize: 14.65.sp,
        color: AppColors.instance.textBlackColor,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get kOtpSentMessageTextStyle => kLanguageTextStyle;

  static TextStyle kTimeRemainderTextStyle({bool isTime = false}) =>
      kInputTextStyle.copyWith(
          color: isTime
              ? AppColors.instance.textBlackColor
              : AppColors.instance.timeRemainderColor);

  static TextStyle get kOtpFieldTextStyle => TextStyle(
        fontSize: 18.95.sp, // 20-px
        color: AppColors.instance.textBlackColor,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.45,
      );

  static TextStyle kGetSmsTextStyle() => kInputTextStyle;

  static TextStyle kSendAgainTextStyle() => kForgotPasswordTextStyle;

  static TextStyle get kEnterPinTextStyle => TextStyle(
        fontSize: 17.95.sp,
        color: AppColors.instance.textBlackColor,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.44,
      );

  static TextStyle get kPinCodeNumberTextStyle => TextStyle(
        fontSize: 24.sp,
        color: AppColors.instance.textBlackColor,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.77,
      );

  static TextStyle get kLogoutTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.15,
      );

  static TextStyle get kMiniHeaderTextStyle => TextStyle(
        fontSize: 18.95.sp,
        color: AppColors.instance.textBlackColor,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.45,
      );

  static TextStyle get kTouchFingerprintSensorTextStyle => TextStyle(
        color: AppColors.instance.touchFingerprintTextColor,
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.15,
      );

  static TextStyle kNotNowTextStyle() => kForgotPasswordTextStyle;

  static TextStyle kAreYouSureLogoutTextStyle() => kInputTextStyle;

  static TextStyle get kYouCanEnterToAppTextStyle => TextStyle(
        fontSize: 16.95.sp,
        color: AppColors.instance.textBlackColor,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.31,
      );

  static TextStyle get kNotificationCounterTextStyle => TextStyle(
        fontSize: 12.sp, //8-px
        fontWeight: FontWeight.w400,
        letterSpacing: -0.24,
        color: AppColors.instance.textWhiteColor,
      );

  static TextStyle get kCardAmountTextStyle => TextStyle(
        fontSize: 17.45.sp, //17-px
        fontWeight: FontWeight.w600,
        letterSpacing: -0.43,
        color: AppColors.instance.textWhiteColor,
      );

  static TextStyle get kMoneySignTextStyle => TextStyle(
        fontSize: 13.sp, //remark
        fontWeight: FontWeight.w300,
        letterSpacing: -0.43,
        color: AppColors.instance.textWhiteColor,
      );

  static TextStyle get kCardNumberTextStyle => TextStyle(
        fontSize: 14.65.sp, //remark
        fontWeight: FontWeight.w400,
        color: AppColors.instance.textWhiteColor,
        letterSpacing: 1,
      );

  static TextStyle get kCardNameTextStyle => TextStyle(
        fontSize: 15.25.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.instance.textWhiteColor,
      );

  static TextStyle kTabBarTextStyle(bool isActive) => TextStyle(
        color: isActive
            ? AppColors.instance.primaryColor
            : AppColors.instance.tabBarTextColor,
        fontSize: 15.27.sp, //13-px
        fontWeight: FontWeight.w500,
        letterSpacing: -0.08,
      );

  static TextStyle get kDottedBoxTitleStyle => TextStyle(
        fontSize: 16.95.sp, //remark
        fontWeight: FontWeight.w500,
        letterSpacing: -0.31,
        color: AppColors.instance.textBlackColor,
      );

  static TextStyle get kDottedBoxSubtitleStyle => TextStyle(
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.15,
        color: AppColors.instance.dottedBoxTextColor,
      );

  static TextStyle get kCategoryTitleStyle => TextStyle(
        fontSize: 17.45.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.31,
        color: AppColors.instance.textBlackColor,
      );

  static TextStyle get kBonusBoxTitleStyle => TextStyle(
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.15,
        color: AppColors.instance.textBlackColor,
      );

  static TextStyle get kBonusBoxSubtitleStyle => TextStyle(
        fontSize: 14.65.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.instance.textBlackColor,
      );

  static TextStyle get kBottomNavBarLabelStyle => TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: -0.24,
        color: AppColors.instance.textBlackColor,
      );

  static TextStyle get kAlertSubtitleStyle => TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.15,
        color: AppColors.instance.timeRemainderColor,
      );

  static TextStyle get kTextButtonTextStyle => TextStyle(
        fontSize: 17.95.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.instance.primaryColor,
      );

  static TextStyle get kRadioBoxTextStyle => TextStyle(
        fontSize: 11.sp,
        color: AppColors.instance.textBlackColor,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.08,
      );

  static TextStyle get kCvvTextStyle => TextStyle(
        fontSize: 9.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 2,
        color: Colors.white,
        shadows: [AppShadow.addCardTextShadow],
      );

  static TextStyle get kAddCardDetailsTextStyle => TextStyle(
        fontSize: 11.sp,
        letterSpacing: -0.45,
        fontWeight: FontWeight.w400,
        color: AppColors.instance.textWhiteColor,
        shadows: [AppShadow.addCardTextShadow],
      );

  static TextStyle get kAddCardCodeObsecureTextStyle => TextStyle(
        fontSize: 13.sp,
        letterSpacing: 4,
        wordSpacing: 3.w,
        fontWeight: FontWeight.w400,
        color: AppColors.instance.textWhiteColor,
        shadows: [AppShadow.addCardTextShadow],
      );

  static TextStyle get kAddCardDateTextStyle => TextStyle(
        fontSize: 9.sp,
        letterSpacing: 2,
        color: AppColors.instance.textWhiteColor,
        fontWeight: FontWeight.w400,
        shadows: [AppShadow.addCardTextShadow],
      );

  static TextStyle get kTransferListTitleStyle => kLogoutTextStyle;

  static TextStyle get kTransferListSubitleStyle => kOptionsItemTextStyle;

  static TextStyle get kTransferListDateTextStyle => TextStyle(
        fontSize: 14.65.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.instance.transferListDateColor,
      );

  static TextStyle get kTransferListCompletedTextStyle => TextStyle(
        fontSize: 14.65.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.instance.successColor,
      );

  static TextStyle get kTransferListSalaryTextStyle => TextStyle(
        fontSize: 14.65.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.instance.transferListDateColor,
      );

  static TextStyle get kNoneWorkDayInfoTextStyle => TextStyle(
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.15,
        color: AppColors.instance.noneWorkDayInfoTextColor,
      );

  static TextStyle get kDottedTitleTextStyle => TextStyle(
        fontSize: 14.65.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.instance.noneWorkDayInfoTextColor,
      );

  static TextStyle get kHistoryTextStyle => TextStyle(
        color: AppColors.instance.primaryColor,
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get ktransferHistorySubtitleTextStyle => TextStyle(
        color: AppColors.instance.transferHistorySubtitleTextColor,
        fontSize: 14.65.sp,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get kUrgentOrderTextStyle => TextStyle(
        color: AppColors.instance.urgentOrderTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 11.sp,
      );

  static TextStyle get kBigCardNumberTextStyle => TextStyle(
        color: AppColors.instance.textWhiteColor,
        fontSize: 13.sp,
        letterSpacing: 4,
        shadows: [AppShadow.addCardTextShadow],
      );
}

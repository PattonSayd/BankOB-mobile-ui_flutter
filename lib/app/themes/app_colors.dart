import 'package:flutter/material.dart';

import 'app_theme_mode.dart';

class AppColors {
  AppThemeMode mode;

  AppColors({this.mode = AppThemeMode.light});

  static AppColors instance = AppColors();

  set setMode(AppThemeMode mode) {
    this.mode = mode;
  }

  Color get primaryColor => mode == AppThemeMode.light
      ? const Color(0xFF00A3C9)
      : const Color(0xFF00A3C9);

  Color get blackColor => mode == AppThemeMode.light
      ? const Color(0xFF000000)
      : const Color(0xFF000000);

  Color get scaffoldColor =>
      mode == AppThemeMode.light ? Colors.transparent : Colors.transparent;

  Color get cardColor => mode == AppThemeMode.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFFFFFFFF);

  Color get inputColor => mode == AppThemeMode.light ? cardColor : cardColor;

  Color get textBlackColor => mode == AppThemeMode.light
      ? const Color(0xFF2D3940)
      : const Color(0xFF2D3940);

  Color get textWhiteColor =>
      mode == AppThemeMode.light ? cardColor : cardColor;

  Color get textLabelColor => mode == AppThemeMode.light
      ? const Color(0xFF9EA4A6)
      : const Color(0xFF9EA4A6);

  Color get dotIndicatorActiveColor =>
      mode == AppThemeMode.light ? primaryColor : primaryColor;

  Color get dotIndicatorInactiveColor => mode == AppThemeMode.light
      ? primaryColor.withOpacity(0.17)
      : primaryColor.withOpacity(0.17);

  Color get iconColor =>
      mode == AppThemeMode.light ? primaryColor : primaryColor;

  Color get optionBoxColor =>
      mode == AppThemeMode.light ? cardColor : cardColor;

  Color get borderInactiveColor => mode == AppThemeMode.light
      ? const Color(0xffD5DEE0)
      : const Color(0xffD5DEE0);

  Color get borderActiveColor => mode == AppThemeMode.light
      ? const Color(0xff80D1E4)
      : const Color(0xff80D1E4);

  Color get borderErrorColor => mode == AppThemeMode.light
      ? const Color(0xFFE75248)
      : const Color(0xFFE75248);

  Color get splashColor => mode == AppThemeMode.light
      ? const Color.fromRGBO(255, 255, 255, 0.38)
      : const Color.fromRGBO(255, 255, 255, 0.38);

  Color get selectedTileColor =>
      mode == AppThemeMode.light ? cardColor : cardColor;

  Color get timeRemainderColor => mode == AppThemeMode.light
      ? const Color(0xff797E80)
      : const Color(0xff797E80);

  Color get otpFieldColor => mode == AppThemeMode.light ? cardColor : cardColor;

  Color get pinCodeBackgroundColor =>
      mode == AppThemeMode.light ? cardColor : cardColor;

  Color get touchFingerprintTextColor =>
      mode == AppThemeMode.light ? timeRemainderColor : timeRemainderColor;

  Color get noneWorkDayInfoTextColor =>
      mode == AppThemeMode.light ? timeRemainderColor : timeRemainderColor;

  Color get transferHistorySubtitleTextColor =>
      mode == AppThemeMode.light ? timeRemainderColor : timeRemainderColor;

  Color get bottomSheetDragLineColor => mode == AppThemeMode.light
      ? const Color(0xffD5DEE0)
      : const Color(0xffD5DEE0);

  Color get tabBarTextColor => mode == AppThemeMode.light
      ? touchFingerprintTextColor
      : touchFingerprintTextColor;

  Color get dottedBoxTextColor => mode == AppThemeMode.light
      ? touchFingerprintTextColor
      : touchFingerprintTextColor;

  Color get bonusBoxColor => mode == AppThemeMode.light
      ? const Color(0xffF5F7F7)
      : const Color(0xffF5F7F7);

  Color get bonusBoxBorderColor => mode == AppThemeMode.light
      ? const Color(0xffF0F2F2)
      : const Color(0xffF0F2F2);

  Color get topPickBoxColor => mode == AppThemeMode.light
      ? const Color(0xffEBF6FA)
      : const Color(0xffEBF6FA);

  Color get forYouBoxColor => mode == AppThemeMode.light
      ? const Color(0xffF0F5F7)
      : const Color(0xffF0F5F7);

  Color get disabledButtonColor => mode == AppThemeMode.light
      ? const Color(0xff80D1E4)
      : const Color(0xff80D1E4);

  Color get disabledButtonTextColor => mode == AppThemeMode.light
      ? const Color.fromRGBO(250, 254, 255, 0.68)
      : const Color.fromRGBO(250, 254, 255, 0.68);

  Color get bottomNavBarBackgroundColor => mode == AppThemeMode.light
      ? const Color.fromRGBO(250, 254, 255, 0.67)
      : const Color.fromRGBO(250, 254, 255, 0.67);

  Color get unselectedBottomNavBarItemColor =>
      mode == AppThemeMode.light ? textLabelColor : textLabelColor;

  Color get selectedBottomNavBarItemColor =>
      mode == AppThemeMode.light ? primaryColor : primaryColor;

  Color get bottomNavBarBorderColor => mode == AppThemeMode.light
      ? const Color(0xFFE2F1F6)
      : const Color(0xFFE2F1F6);

  Color get currencyTextColor => mode == AppThemeMode.light
      ? const Color.fromARGB(255, 109, 111, 111)
      : const Color.fromARGB(255, 109, 111, 111);

  Color get radioBoxBorderColor => mode == AppThemeMode.light
      ? const Color(0xFFE1E6E8)
      : const Color(0xFFE1E6E8);

  Color get errorColor => mode == AppThemeMode.light
      ? const Color(0xffE75248)
      : const Color(0xffE75248);

  Color get successColor => mode == AppThemeMode.light
      ? const Color(0xff3CBF80)
      : const Color(0xff3CBF80);

  Color get chartSecondLineColor => mode == AppThemeMode.light
      ? const Color(0xffFBA27D)
      : const Color(0xffFBA27D);

  Color get chartDashColor => mode == AppThemeMode.light
      ? const Color(0xffD4D8E2)
      : const Color(0xffD4D8E2);

  Color get transferListDateColor =>
      mode == AppThemeMode.light ? timeRemainderColor : timeRemainderColor;

  Color get confirmLabelColor =>
      mode == AppThemeMode.light ? timeRemainderColor : timeRemainderColor;

  Color get slideToActBackgroundColor =>
      mode == AppThemeMode.light ? bonusBoxBorderColor : bonusBoxBorderColor;

  Color get dividerColor =>
      mode == AppThemeMode.light ? bonusBoxBorderColor : bonusBoxBorderColor;

  Color get confirmDividerColor =>
      mode == AppThemeMode.light ? radioBoxBorderColor : radioBoxBorderColor;

  Color get urgentOrderTextColor =>
      mode == AppThemeMode.light ? bonusBoxBorderColor : bonusBoxBorderColor;

  List<Color> get scaffoldGradientColors => mode == AppThemeMode.light
      ? [
          const Color(0xffF0F5F7),
          const Color(0xffE6F1F5),
        ]
      : [
          const Color(0xffF0F5F7),
          const Color(0xffE6F1F5),
        ];

  List<Color> get cvvGradientColors => mode == AppThemeMode.light
      ? [
          const Color.fromRGBO(255, 255, 255, 0.21),
          const Color.fromRGBO(255, 255, 255, 0.51),
        ]
      : [
          const Color.fromRGBO(255, 255, 255, 0.21),
          const Color.fromRGBO(255, 255, 255, 0.51),
        ];
  List<Color> get cardGradientColors => mode == AppThemeMode.light
      ? [
          const Color.fromRGBO(255, 255, 255, 0.0588),
          const Color.fromRGBO(255, 255, 255, 0.1428),
        ]
      : [
          const Color.fromRGBO(255, 255, 255, 0.0588),
          const Color.fromRGBO(255, 255, 255, 0.1428),
        ];

  List<Color> get bottomPanelColor => mode == AppThemeMode.light
      ? scaffoldGradientColors
      : scaffoldGradientColors;

  List<Color> get backgroundImageGradientColors => mode == AppThemeMode.light
      ? [
          const Color(0xff3793A2),
          const Color(0xff44A4B4),
          const Color(0xff4CADBD),
        ]
      : [
          const Color(0xff3793A2),
          const Color(0xff44A4B4),
          const Color(0xff4CADBD),
        ];
}

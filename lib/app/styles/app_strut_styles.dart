import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppStrutStyles {
  AppStrutStyles._();

  static StrutStyle get kDefault => const StrutStyle(
        height: 1,
        leading: 0.16, //16lh
      );

  static StrutStyle get kFootnote => const StrutStyle(
        height: 1, //14lh  f-size: 10px
      );

  static StrutStyle get kCaption => const StrutStyle(
        leading: 0.13, //18lh  f-size: 12px/13px
      );

  static StrutStyle get kBodyS => const StrutStyle(
        leading: 0.27, //20lh  f-size: 14px
      );

  static StrutStyle get kBodyM => const StrutStyle(
        leading: 0.55, //24lh  f-size 16px
      );

  static StrutStyle get kHeadlineS => const StrutStyle(
        leading: 0.55, //24lh  f-size 17px
      );

  static StrutStyle get kHeadlineM => const StrutStyle(
        leading: 0.7, //26lh  f-size 18px
      );

  static StrutStyle get kTitle => StrutStyle(
        leading: 0.25, //28lh & 32lh  f-size 20px/24px
        fontSize: 18.95.sp,
      );

  static StrutStyle get appBarHeader => StrutStyle(
        fontSize: 20.75.sp,
        leading: 0.18,
      );

  static StrutStyle get dynamicDepositMainTitle => StrutStyle(
        fontSize: 17.45.sp,
        leading: 0.25,
      );
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension ContextExtension on BuildContext {
  Size get deviceSize => MediaQuery.of(this).size;
  ThemeData get deviceTheme => Theme.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get deviceHeight => deviceSize.height;
  double get deviceWidth => deviceSize.width;

  double flexibleHeight(double v) => deviceHeight * v;
  double flexibleWidth(double v) => deviceWidth * v;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAll16 => EdgeInsets.all(2.h);
  EdgeInsets get paddingAll20 => EdgeInsets.all(2.63.h);
  EdgeInsets get paddingAll24 => EdgeInsets.all(2.8.h);
  EdgeInsets get paddingHorizontal6 => EdgeInsets.symmetric(horizontal: 0.4.h);
  EdgeInsets get paddingHorizontal16 => EdgeInsets.symmetric(horizontal: 2.1.h);
  EdgeInsets get paddingHorizontal20 => EdgeInsets.symmetric(horizontal: 2.4.h);
  EdgeInsets get paddingHorizontal24 => EdgeInsets.symmetric(horizontal: 2.8.h);
  EdgeInsets get paddingHorizontal28 =>
      EdgeInsets.symmetric(horizontal: 3.68.h); //remark
  EdgeInsets get paddingTop24 => EdgeInsets.only(top: 2.8.h);
  EdgeInsets get paddingVertical16 => EdgeInsets.symmetric(vertical: 2.1.h);
  EdgeInsets get paddingVertical24 => EdgeInsets.symmetric(vertical: 2.8.h);

  EdgeInsets get contentPadding =>
      EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.35.h);

  EdgeInsets get paddingHorizontal20Vertical16 =>
      EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 2.h);

  EdgeInsets get paddingHorizontal16Vertical32 =>
      EdgeInsets.symmetric(horizontal: 2.1.h, vertical: 3.6.h);

  EdgeInsets get paddingHorizontal16Top24 =>
      EdgeInsets.only(left: 2.1.h, right: 2.1.h, top: 3.16.h);

  EdgeInsets get paddingVertical32 => EdgeInsets.symmetric(vertical: 3.6.h);

  EdgeInsets get paddingOnlyRight16 => EdgeInsets.only(right: 2.h);

  EdgeInsets paddingAll(double v) => EdgeInsets.all(v);
  EdgeInsets paddingSymmetric(double horizontal, double vertical) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  EdgeInsets paddingOnlyTop(double v) => EdgeInsets.only(top: v);
  EdgeInsets paddingOnlyLeft(double v) => EdgeInsets.only(left: v);
  EdgeInsets paddingOnlyRight(double v) => EdgeInsets.only(right: v);
}

extension BorderExtension on BuildContext {
  BorderRadius get borderRadiusAll3 =>
      const BorderRadius.all(Radius.circular(3));

  BorderRadius get borderRadiusAll8 =>
      const BorderRadius.all(Radius.circular(8));

  BorderRadius get borderRadiusAll12 =>
      const BorderRadius.all(Radius.circular(12));

  BorderRadius get borderRadiusAll16 =>
      const BorderRadius.all(Radius.circular(16));

  BorderRadius get borderRadiusTop16 =>
      const BorderRadius.vertical(top: Radius.circular(16));

  BorderRadius get borderRadiusTop24 =>
      const BorderRadius.vertical(top: Radius.circular(24));

  BorderRadius get borderRadiusTop28 =>
      const BorderRadius.vertical(top: Radius.circular(28));

  BorderRadius borderRadiusAll(double v) =>
      BorderRadius.all(Radius.circular(v));

  RoundedRectangleBorder get roundedRectangleBorderAll3 =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(3));

  RoundedRectangleBorder get roundedRectangleBorderAll12 =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));

  RoundedRectangleBorder get roundedRectangleBorderAll16 =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));

  RoundedRectangleBorder get roundedRectangleBorderTop28 =>
      const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)));

  RoundedRectangleBorder get roundedRectangleBorderTop8 =>
      const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)));

  RoundedRectangleBorder roundedRectangleBorderAll(double v) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(v));

  Radius get radiusAll16 => const Radius.circular(16);
  Radius get radiusAll12 => const Radius.circular(12);
}

extension DurationExtension on BuildContext {
  Duration get durationMSec300 => const Duration(milliseconds: 300);
  Duration get durationMSec600 => const Duration(milliseconds: 600);
  Duration get durationSec1 => const Duration(seconds: 1);
}

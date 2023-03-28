import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../extensions/context_extension.dart';
import '../styles/app_text_styles.dart';
import 'app_colors.dart';
import 'app_theme_mode.dart';

class AppThemes {
  static ThemeData appThemes({
    required BuildContext context,
    AppThemeMode themeMode = AppThemeMode.light,
  }) {
    AppColors appColors = AppColors.instance;
    appColors.mode = themeMode;

    return ThemeData(
      fontFamily: 'SF Pro Text',
      primarySwatch: buildMaterialColor(appColors.primaryColor),
      scaffoldBackgroundColor: appColors.scaffoldColor,
      cardColor: appColors.cardColor,
      // disabledColor: appColors.disabledButton,
      // errorColor: appColors.error,
      // dividerColor: appColors.divider,
      primaryColor: appColors.primaryColor,
      // splashColor: appColors.splashColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appColors.primaryColor,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        titleTextStyle: AppTextStyles.kHeaderTextStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        floatingLabelStyle: AppTextStyles.kFloatingLabelStyle,
        labelStyle: AppTextStyles.kLabelTextStyle,
        contentPadding: context.contentPadding,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 6.h),
          padding: EdgeInsets.zero,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: context.roundedRectangleBorderAll12,
        ),
      ),
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: appColors.primaryColor),
    );
  }
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/extensions/context_extension.dart';
import '../themes/app_colors.dart';

class AppButtonStyles {
  static ButtonStyle kGlobalButtonStyle(
    BuildContext context,
    bool? showBorder,
  ) =>
      ElevatedButton.styleFrom(
        foregroundColor: showBorder == null
            ? AppColors.instance.textWhiteColor
            : AppColors.instance.primaryColor,
        backgroundColor: showBorder == null
            ? AppColors.instance.primaryColor
            : Colors.transparent,
        disabledBackgroundColor: AppColors.instance.disabledButtonColor,
        disabledForegroundColor: AppColors.instance.disabledButtonTextColor,
        minimumSize: Size(context.deviceWidth, 6.58.h),
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: context.roundedRectangleBorderAll12,
        side: showBorder == null
            ? null
            : BorderSide(
                color: AppColors.instance.primaryColor,
              ),
      );

  static ButtonStyle kGlobalTextButtonStyle(BuildContext context) =>
      TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(context.deviceWidth, 6.58.h),
        shape: context.roundedRectangleBorderAll12,
      );
}

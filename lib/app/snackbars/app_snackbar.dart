import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../themes/app_colors.dart';

class AppSnackbar {
  static void showAppSnackbar(BuildContext context, String text, Color color) {
    showTopSnackBar(
      context,
      Container(
        width: context.deviceWidth,
        padding: context.paddingAll16,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.instance.successColor,
          borderRadius: context.borderRadiusAll8,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 13,
            color: AppColors.instance.textWhiteColor,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.08,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}

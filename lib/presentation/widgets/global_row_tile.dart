// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';

import '../../../../../../app/themes/app_colors.dart';

enum ImageFormat {
  svg,
  png,
}

class GlobalRowTile extends StatelessWidget {
  final dynamic rowTileItem;
  final ImageFormat? imageFormat;
  const GlobalRowTile({
    Key? key,
    required this.rowTileItem,
    this.imageFormat = ImageFormat.svg,
  }) : super(key: key);

  TextStyle get kRowTileTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 16.95.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.31,
      );

  BoxDecoration kRowTileDecoration(BuildContext context) => BoxDecoration(
        color: AppColors.instance.bonusBoxColor,
        borderRadius: context.borderRadiusAll12,
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: AppColors.instance.bonusBoxBorderColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.10.h),
      child: Row(
        children: [
          Container(
            height: 5.26.h,
            width: 10.18.w,
            decoration: kRowTileDecoration(context),
            child: ImageFormat.png == imageFormat
                ? Image.asset(rowTileItem.icon)
                : SvgPicture.asset(
                    rowTileItem.icon,
                    fit: BoxFit.scaleDown,
                  ),
          ),
          SizedBox(width: 2.1.h),
          Text(
            rowTileItem.title,
            style: kRowTileTextStyle,
            strutStyle: AppStrutStyles.kBodyM,
          ),
        ],
      ),
    );
  }
}

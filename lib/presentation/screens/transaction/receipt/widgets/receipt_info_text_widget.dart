import 'package:bank_of_baku_app/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReceiptInfoTextWidget extends StatelessWidget {
  final String labelText;
  final String text;
  const ReceiptInfoTextWidget({
    Key? key,
    required this.labelText,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: AppColors.instance.confirmLabelColor,
              fontWeight: FontWeight.w400,
              fontSize: 15.85.sp,
            ),
          ),
          SizedBox(height: 0.65.h),
          Text(
            text,
            style: TextStyle(
                color: AppColors.instance.textBlackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.95.sp,
                letterSpacing: -0.31),
          ),
          SizedBox(height: 2.1.h),
          Divider(
            thickness: 0.5, // thickness of the line
            color: AppColors.instance.confirmDividerColor,
          ),
          SizedBox(height: 2.1.h),
        ],
      );
}
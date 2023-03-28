import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class DynamicDepositWidget extends StatelessWidget {
  final dynamic dynamicDepositItems;
  const DynamicDepositWidget({
    super.key,
    required this.dynamicDepositItems,
  });

  TextStyle get kdynamicDepositListTitle => TextStyle(
        color: const Color(0xFF797E80),
        fontSize: 15.85.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.15,
      );

  TextStyle get kdynamicDepositListSubTitle => TextStyle(
        color: const Color(0xFF2D3940),
        fontSize: 16.95.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.31,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(0.79.h),
              child: SvgPicture.asset(
                dynamicDepositItems.icon,
              ),
            ),
            SizedBox(width: 2.1.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dynamicDepositItems.title,
                  style: kdynamicDepositListTitle,
                  strutStyle: AppStrutStyles.kBodyS,
                ),
                SizedBox(height: 0.26.h),
                Text(
                  dynamicDepositItems.descript,
                  style: kdynamicDepositListSubTitle,
                  strutStyle: AppStrutStyles.kBodyM,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

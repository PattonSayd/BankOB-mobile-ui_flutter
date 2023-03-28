import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../app/styles/app_box_decorations.dart';
import '../../../../../../app/themes/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardMenuItemWidget extends StatelessWidget {
  final dynamic cardMenuItems;
  const CardMenuItemWidget({
    super.key,
    required this.cardMenuItems,
  });

  TextStyle get kcardMenuTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 16.95.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.31,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.10.h),
          child: Row(
            children: [
              Container(
                height: 5.26.h,
                width: 10.18.w,
                decoration: AppBoxDecorations.kBonusBoxDecoration(context),
                child: SvgPicture.asset(
                  cardMenuItems.icon,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(width: 2.1.h),
              Text(cardMenuItems.title, style: kcardMenuTextStyle),
            ],
          ),
        ),
        const DividerTheme(
          data: DividerThemeData(space: 0),
          child: Divider(
            color: Color(0xFFF0F2F2),
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}

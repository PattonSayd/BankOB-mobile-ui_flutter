import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/extensions/context_extension.dart';
import '../../../../../app/styles/app_box_decorations.dart';
import '../../../../../app/themes/app_colors.dart';

class TransferItems extends StatelessWidget {
  final dynamic templateItem;
  const TransferItems({
    super.key,
    required this.templateItem,
  });

  TextStyle get kMenuTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 16.95.sp, //16px
        fontWeight: FontWeight.w500,
        letterSpacing: -0.31,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: context.paddingVertical16,
          height: 5.26.h,
          width: 10.18.w,
          decoration: AppBoxDecorations.kBonusBoxDecoration(context),
          child: SvgPicture.asset(
            templateItem.icon,
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(width: 2.10.h),
        Text(
          templateItem.title,
          style: kMenuTextStyle,
          strutStyle: AppStrutStyles.kHeadlineS,
        ),
      ],
    );
  }
}

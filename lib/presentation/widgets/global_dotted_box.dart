import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/extensions/context_extension.dart';
import '../../../../app/themes/app_colors.dart';
import '../../app/styles/app_text_styles.dart';

class GlobalDottedBox extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isActive;
  final Widget icon;
  final String? trailing;

  const GlobalDottedBox({
    Key? key,
    required this.title,
    this.subtitle,
    this.isActive = true,
    required this.icon,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double? trailingLen = double.tryParse(trailing!);
    List? chunks;
    if (trailingLen != null) {
      final int n = trailing!.indexOf(".");
      final separation =
          "${trailing!.substring(0, n - 3)} ${trailing!.substring(n - 3, trailing!.length)}";
      chunks = [separation.substring(0, n + 1), separation.substring(n + 1)];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gonderen',
          style: AppTextStyles.kDottedTitleTextStyle,
        ),
        SizedBox(height: 0.92.h),
        DottedBorder(
          dashPattern: const [0, 4, 6, 0],
          strokeWidth: 1.2,
          color: isActive
              ? AppColors.instance.borderActiveColor
              : AppColors.instance.borderInactiveColor,
          borderType: BorderType.RRect,
          radius: const Radius.circular(8),
          padding: context.paddingAll16,
          child: Row(
            children: [
              icon,
              SizedBox(width: 2.10.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15.85.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.15,
                        color: AppColors.instance.textBlackColor,
                      ),
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: 0.52.h),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 14.65.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.instance.dottedBoxTextColor,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(
                height: trailingLen != null ? null : 4.60.h,
                child: RichText(
                  text: TextSpan(
                    text: trailingLen != null ? chunks![0] : trailing,
                    style: TextStyle(
                      fontSize: 15.85.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.15,
                      color: Colors.black,
                    ),
                    children: [
                      if (trailingLen != null)
                        TextSpan(
                          text: chunks![1],
                          style: TextStyle(
                            fontSize: 14.65.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF797E80),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

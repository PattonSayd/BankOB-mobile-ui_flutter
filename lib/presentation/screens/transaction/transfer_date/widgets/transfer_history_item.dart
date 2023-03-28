import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bank_of_baku_app/app/extensions/context_extension.dart';

import '../../../../../app/styles/app_text_styles.dart';
import '../../../../../app/themes/app_colors.dart';
import '../viewmodels/transfer_date_model.dart';

class TransferHistoryItem extends StatelessWidget {
  final int index;
  final TransferDateModel transferDateModel;
  final List chunks;

  const TransferHistoryItem({
    Key? key,
    required this.index,
    required this.transferDateModel,
    required this.chunks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index == 0 || index == 5) ...[
          SizedBox(height: 2.63.h),
          Text(
            transferDateModel.timeStamp,
            style: TextStyle(
              fontSize: 14.65.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.instance.timeRemainderColor,
            ),
          ),
          SizedBox(height: 1.31.h),
        ],
        ListTile(
          dense: true,
          horizontalTitleGap: 12,
          visualDensity: const VisualDensity(horizontal: 0, vertical: 0.8),
          contentPadding: EdgeInsets.zero,
          title: Text(
            transferDateModel.title,
            style: TextStyle(
              color: AppColors.instance.textBlackColor,
              fontSize: 16.95.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.31,
            ),
          ),
          // isThreeLine: true,
          subtitle: Text(
            transferDateModel.subtitle,
            style: AppTextStyles.ktransferHistorySubtitleTextStyle,
          ),
          leading: Container(
            padding: context.paddingSymmetric(1.97.h, 1.58.h),
            decoration: BoxDecoration(
              borderRadius: context.borderRadiusAll12,
              color: AppColors.instance.dividerColor,
            ),
            child: SvgPicture.asset(
              transferDateModel.icon,
            ),
          ),
          trailing: _buildTrailing(chunks),
        ),
      ],
    );
  }

  Widget _buildTrailing(List chunks) => SizedBox(
        height: 5.37.h,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: chunks[0],
                style: TextStyle(
                  fontSize: 16.95.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.instance.blackColor,
                  letterSpacing: -0.31,
                ),
              ),
              TextSpan(
                text: '.${chunks[1]}',
                style: TextStyle(
                  fontSize: 14.65.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.instance.transferHistorySubtitleTextColor,
                ),
              ),
              // TextSpan(text: splitByLength())
            ],
          ),
        ),
      );
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../widgets/global_card_amount_text.dart';
import '../viewmodels/mini_credit_item_model.dart';

class MiniCreditItemWidget extends StatelessWidget {
  final MiniCreditItemModel miniCredit;
  final bool isLastItem;
  const MiniCreditItemWidget({
    Key? key,
    required this.miniCredit,
    required this.isLastItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36.15.w, //remark
          padding: context.paddingHorizontal20Vertical16,
          decoration:
              AppBoxDecorations.kMiniCardDecoration(context, miniCredit.image),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalCardAmountText(
                  amount: miniCredit.amount, sign: miniCredit.sign),
              const Spacer(),
              Text(miniCredit.title, style: AppTextStyles.kCardNameTextStyle),
              SizedBox(height: 0.2.h),
              Text(
                miniCredit.subtitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyles.kCardNumberTextStyle
                    .copyWith(letterSpacing: 0), //remark
              ),
            ],
          ),
        ),
        if (isLastItem) ...[
          //remark
          SizedBox(width: 2.5.h),
          SvgPicture.asset(
            AppAssets.arrow,
            width: 2.10.h, //remark
            height: 2.10.h,
          ),
        ]
      ],
    );
  }
}

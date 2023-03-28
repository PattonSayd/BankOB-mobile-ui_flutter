import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../widgets/global_card_amount_text.dart';
import '../viewmodels/mini_deposit_item_model.dart';

class MiniDepositItemWidget extends StatelessWidget {
  final MiniDepositItemModel miniDeposit;
  final bool isLastItem;
  const MiniDepositItemWidget({
    super.key,
    required this.miniDeposit,
    required this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36.15.w, //remark
          padding: context.paddingHorizontal20Vertical16,
          decoration:
              AppBoxDecorations.kMiniCardDecoration(context, miniDeposit.image),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalCardAmountText(
                  amount: miniDeposit.amount, sign: miniDeposit.sign),
              const Spacer(),
              Text(miniDeposit.title, style: AppTextStyles.kCardNameTextStyle),
              SizedBox(height: 0.2.h),
              Text(
                miniDeposit.subtitle,
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

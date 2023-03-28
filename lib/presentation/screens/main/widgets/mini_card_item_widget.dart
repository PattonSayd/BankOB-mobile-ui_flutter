// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/presentation/screens/main/viewmodels/mini_card_item_model.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../widgets/global_card_amount_text.dart';

class MiniCardItemWidget extends StatelessWidget {
  final MiniCardItemModel miniCard;
  final bool isLastItem;
  const MiniCardItemWidget({
    Key? key,
    required this.miniCard,
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
              AppBoxDecorations.kMiniCardDecoration(context, miniCard.image),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalCardAmountText(
                  amount: miniCard.amount, sign: miniCard.sign),
              const Spacer(),
              Text(miniCard.number, style: AppTextStyles.kCardNumberTextStyle),
              SizedBox(height: 0.52.h), //remark
              Text(miniCard.name, style: AppTextStyles.kCardNameTextStyle),
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

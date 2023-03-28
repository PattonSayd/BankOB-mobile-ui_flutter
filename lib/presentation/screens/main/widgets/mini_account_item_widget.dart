// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../widgets/global_card_amount_text.dart';
import '../viewmodels/mini_account_item_model.dart';

class MiniAccountItemWidget extends StatelessWidget {
  final MiniAccountItemModel miniAccount;
  final bool isLastItem;
  const MiniAccountItemWidget({
    Key? key,
    required this.miniAccount,
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
              AppBoxDecorations.kMiniCardDecoration(context, miniAccount.image),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalCardAmountText(
                  amount: miniAccount.amount, sign: miniAccount.sign),
              const Spacer(),
              Text(miniAccount.name, style: AppTextStyles.kCardNameTextStyle),
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

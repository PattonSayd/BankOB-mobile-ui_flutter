import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../viewmodels/bonus_item_model.dart';

class BonusItemWidget extends StatelessWidget {
  final BonusItemModel bonusItem;
  const BonusItemWidget({
    super.key,
    required this.bonusItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.15.w, //remark
      padding: context.paddingAll20,
      decoration: AppBoxDecorations.kBonusBoxDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(bonusItem.icon),
          SizedBox(height: 1.58.h),
          Text(bonusItem.title, style: AppTextStyles.kBonusBoxTitleStyle),
          SizedBox(height: 0.79.h), //remark
          Text(bonusItem.subtitle, style: AppTextStyles.kBonusBoxSubtitleStyle),
        ],
      ),
    );
  }
}

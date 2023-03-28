import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../viewmodels/top_pick_item_model.dart';

class TopPickitemWidget extends StatelessWidget {
  final TopPickItemModel topPickItem;
  const TopPickitemWidget({
    super.key,
    required this.topPickItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.70.h, //remark
      padding: EdgeInsets.only(left: 2.63.h, top: 24),
      decoration: AppBoxDecorations.kTopPickBoxDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            topPickItem.icon,
            width: 2.10.h, //remark
            height: 2.10.h,
          ),
          SizedBox(height: 1.31.h), //remark
          Text(topPickItem.title, style: AppTextStyles.kBonusBoxTitleStyle),
          SizedBox(height: 0.79.h), //remark
          Text(topPickItem.subtitle,
              style: AppTextStyles.kBonusBoxSubtitleStyle),
        ],
      ),
    );
  }
}

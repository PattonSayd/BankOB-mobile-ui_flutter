import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../viewmodels/for_you_item_model.dart';

class ForYouItemWidget extends StatelessWidget {
  final ForYouItemModel forYouItem;
  const ForYouItemWidget({
    super.key,
    required this.forYouItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29.63.h, //remark,
      decoration: AppBoxDecorations.kForYouBoxDecoration(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20, top: 20, bottom: 20, right: 8), //remark,
            child: SizedBox(
              width: 17.12.h, //remark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    forYouItem.title,
                    style: AppTextStyles.kBonusBoxTitleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, //remark,
                  ),
                  SizedBox(height: 0.52.h),
                  Text(forYouItem.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.kBonusBoxSubtitleStyle),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            forYouItem.icon,
            width: 8.16.h, //remark,
            height: 7.11.h,
          ),
          SizedBox(height: 0.52.h),
        ],
      ),
    );
  }
}

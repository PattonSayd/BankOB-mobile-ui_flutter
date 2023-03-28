import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/themes/app_colors.dart';

class TemplateItemWidget extends StatelessWidget {
  final dynamic templateItem;
  final bool isLastItem;
  const TemplateItemWidget({
    super.key,
    required this.templateItem,
    required this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 8.42.h, //remark
              width: 8.42.h, //remark
              padding: context.paddingAll20,
              decoration: AppBoxDecorations.kBonusBoxDecoration(context),
              child: SvgPicture.asset(templateItem.icon),
            ),
            const SizedBox(height: 8),
            Text(templateItem.title,
                style: AppTextStyles.kBonusBoxSubtitleStyle),
          ],
        ),
        if (isLastItem)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 1.4.h),
              Column(
                children: [
                  Container(
                      height: 8.h,
                      width: 8.h,
                      padding: const EdgeInsets.all(2),
                      child: DottedBorder(
                        dashPattern: const [0, 4, 6, 0],
                        strokeWidth: 1.2,
                        color: AppColors.instance.borderActiveColor,
                        borderType: BorderType.RRect,
                        radius: context.radiusAll12,
                        padding: EdgeInsets.zero,
                        child:
                            Center(child: SvgPicture.asset(AppAssets.addIcon)),
                      )),
                  const SizedBox(height: 8),
                  Text(appLocalizations.newText,
                      style: AppTextStyles.kBonusBoxSubtitleStyle),
                ],
              ),
            ],
          ),
      ],
    );
  }
}

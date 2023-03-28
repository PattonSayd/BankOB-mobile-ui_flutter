import '../../../../app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../../app/themes/app_colors.dart';
import '../viewmodels/options_item_model.dart';

class OptionsWidget extends StatelessWidget {
  final List<OptionsItemModel> optionsList;
  const OptionsWidget({
    Key? key,
    required this.optionsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      padding: EdgeInsets.zero,
      mainAxisSpacing: 2.h,
      crossAxisSpacing: 2.w,
      children: optionsList
          .map((OptionsItemModel item) => _optionItem(item, context))
          .toList(),
    );
  }

  Widget _optionItem(OptionsItemModel item, BuildContext context) {
    return Column(
      children: [
        Container(
          width: 12.22.w,
          height: 6.32.h,
          padding: context.paddingAll(15),
          decoration: AppBoxDecorations.kOptionsItemDecoration(context),
          child: SvgPicture.asset(
            item.itemIcon,
            color: AppColors.instance.iconColor,
          ),
        ),
        SizedBox(height: 1.15.h),
        Text(
          item.itemText,
          style: Theme.of(context).textTheme.caption!.merge(
                AppTextStyles.kOptionsItemTextStyle,
              ),
        ),
      ],
    );
  }
}

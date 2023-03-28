import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_text_styles.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryTitle;
  final double? titleSize;
  final bool isArrow;
  final List<Object> modelList;
  final Function(int) onReturn;
  final double? listHeight;
  const CategoryWidget({
    super.key,
    required this.categoryTitle,
    this.isArrow = false,
    required this.modelList,
    required this.onReturn,
    this.titleSize,
    this.listHeight,
  });

  @override
  Widget build(BuildContext context) {
    final kCategoryTitleStyle = AppTextStyles.kCategoryTitleStyle;
    return Column(
      children: [
        Padding(
          padding: context.paddingHorizontal16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categoryTitle,
                style: Theme.of(context).textTheme.headlineMedium!.merge(
                      titleSize == null
                          ? kCategoryTitleStyle
                          : kCategoryTitleStyle.copyWith(fontSize: titleSize),
                    ),
              ),
              if (isArrow)
                SvgPicture.asset(
                  AppAssets.arrow,
                  width: 2.10.h, //remark
                  height: 2.10.h,
                ),
            ],
          ),
        ),
        SizedBox(height: 2.83.h), //remark
        SizedBox(
          height: listHeight,
          child: ListView.separated(
            itemCount: modelList.length,
            scrollDirection: Axis.horizontal,
            padding: context.paddingHorizontal16,
            separatorBuilder: (context, index) => SizedBox(width: 1.4.h),
            itemBuilder: (context, index) => onReturn(index),
          ),
        ),
      ],
    );
  }
}

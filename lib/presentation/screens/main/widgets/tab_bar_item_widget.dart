import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../viewmodels/tab_bar_item_model.dart';

class TabBarItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final TabBarItemModel tabBarItem;
  final double? width;
  const TabBarItemWidget({
    Key? key,
    required this.onTap,
    required this.isActive,
    required this.tabBarItem,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 11.h,
        alignment: Alignment.center,
        decoration: AppBoxDecorations.kTabBarDecoration(context, isActive),
        child: Text(
          tabBarItem.text,
          style: AppTextStyles.kTabBarTextStyle(isActive),
        ),
      ),
    );
  }
}

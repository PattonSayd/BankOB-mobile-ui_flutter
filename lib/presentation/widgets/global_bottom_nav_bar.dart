import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/styles/app_box_decorations.dart';
import '../../app/styles/app_text_styles.dart';
import '../../app/themes/app_colors.dart';
import '../screens/main/viewmodels/bottom_nav_bar_item_model.dart';

class GlobalBottomNavBar extends StatelessWidget {
  final List<BottomNavBarItemModel> bottomNavBarItems;
  final int navBarIndex;
  final void Function(int) onTap;

  const GlobalBottomNavBar({
    super.key,
    required this.bottomNavBarItems,
    required this.navBarIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kBottomNavBarBoxDecoration,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.instance.bottomNavBarBackgroundColor,
        onTap: onTap,
        currentIndex: navBarIndex,
        selectedItemColor: AppColors.instance.primaryColor,
        unselectedItemColor: AppColors.instance.unselectedBottomNavBarItemColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        selectedFontSize: 13.40.sp, //10-px
        unselectedFontSize: 13.40.sp,
        selectedLabelStyle: AppTextStyles.kBottomNavBarLabelStyle,
        unselectedLabelStyle: AppTextStyles.kBottomNavBarLabelStyle,
        items: bottomNavBarItems
            .map((item) => BottomNavigationBarItem(
                  icon: _buildIcon(item, false),
                  activeIcon: _buildIcon(item, true),
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildIcon(BottomNavBarItemModel item, bool isActive) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SvgPicture.asset(
          item.icon,
          color: isActive
              ? AppColors.instance.selectedBottomNavBarItemColor
              : AppColors.instance.unselectedBottomNavBarItemColor,
        ),
      );
}

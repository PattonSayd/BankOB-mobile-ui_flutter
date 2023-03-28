import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../app/themes/app_colors.dart';

class MenuItemWidget extends StatelessWidget {
  final dynamic menuItems;
  const MenuItemWidget({
    super.key,
    required this.menuItems,
  });

  TextStyle get kMenuItemTitleTextStyle => const TextStyle(
        color: Color(0xFF797E80),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.15,
      );

  TextStyle get kMenuItemSubTitleTextStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.31,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          menuItems.title,
          style: kMenuItemTitleTextStyle,
          strutStyle: AppStrutStyles.kBodyS,
        ),
        const SizedBox(height: 2),
        Text(
          menuItems.subTitle,
          style: kMenuItemSubTitleTextStyle,
          strutStyle: AppStrutStyles.kBodyM,
        ),
        const SizedBox(height: 16),
        const DividerTheme(
          data: DividerThemeData(space: 0),
          child: Divider(
            color: Color(0xFFF0F2F2),
            thickness: 0.5,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

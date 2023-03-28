import 'package:badges/badges.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../../app/themes/app_colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Align(
        alignment: Alignment.centerRight,
        child: SvgPicture.asset(
          AppAssets.account,
          height: 3.42.h, //remark
          width: 3.42.h, //remark
        ),
      ),
      actions: [
        SvgPicture.asset(
          AppAssets.search,
          height: 2.89.h, //remark
          width: 2.89.h, //remark
        ),
        SizedBox(width: 2.2.h),
        Center(
          child: Badge(
            padding: context.paddingSymmetric(0.64.h, 0.26.h), //remark
            position: BadgePosition.topEnd(top: -2, end: -4), //remark
            badgeContent: Text(
              '7',
              style: AppTextStyles.kNotificationCounterTextStyle,
            ),
            animationType: BadgeAnimationType.slide,
            elevation: 0, //remark
            badgeColor: AppColors.instance.primaryColor,
            child: SvgPicture.asset(
              AppAssets.notification,
              height: 2.89.h, //remark
              width: 2.89.h, //remark
            ),
          ),
        ),
        SizedBox(width: 4.21.h), //remark
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

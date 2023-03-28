// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/styles/app_text_styles.dart';
import '../../app/themes/app_colors.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final bool showTitleText;
  final String? actionIcon;
  const GlobalAppBar({
    Key? key,
    this.titleText,
    this.showTitleText = true,
    this.actionIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      leading: Icon(Icons.arrow_back_ios,
          color: AppColors.instance.iconColor), //remark
      title: showTitleText
          ? Text(
              titleText!,
              strutStyle: AppStrutStyles.appBarHeader,
            )
          : null,
      actions: [
        if (actionIcon != null)
          IconButton(
            padding: context.paddingOnlyRight16,
            icon: SvgPicture.asset(actionIcon!,
                color: AppColors.instance.iconColor, semanticsLabel: 'Label'),
            onPressed: () {},
          )
      ],
      titleTextStyle: AppTextStyles.kHeaderTextStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

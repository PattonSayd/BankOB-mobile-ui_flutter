import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app/constants/app_assets.dart';
import '../../app/themes/app_colors.dart';

class GlobalSearch extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final AppLocalizations appLocalizations;

  const GlobalSearch({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onTap: () {},
      decoration: InputDecoration(
        contentPadding: context.paddingSymmetric(1.05.h, 1.38.h),
        isDense: true,
        hintText: '${appLocalizations.search}...',
        hintStyle: TextStyle(
          color: AppColors.instance.textLabelColor,
          fontSize: 16.95.sp,
          letterSpacing: -0.31,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        filled: true,
        fillColor: AppColors.instance.bonusBoxColor,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 1.58.h, right: 1.05.h),
          child: SvgPicture.asset(AppAssets.searchLandlines),
        ),
        prefixIconConstraints: const BoxConstraints(),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

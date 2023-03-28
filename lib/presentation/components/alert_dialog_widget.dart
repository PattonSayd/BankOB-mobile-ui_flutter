import 'package:bank_of_baku_app/app/constants/app_assets.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/app/styles/app_box_decorations.dart';
import 'package:bank_of_baku_app/app/styles/app_text_styles.dart';
import 'package:bank_of_baku_app/app/themes/app_colors.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/global_bottom_sheet_drag_line.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: AppColors.instance.cardColor,
      shape: context.roundedRectangleBorderAll16,
      actionsPadding: context.paddingAll20,
      titlePadding: context.paddingHorizontal24,
      contentPadding: context.paddingHorizontal24,
      insetPadding: context.paddingHorizontal24,
      title: Column(
        children: [
          SizedBox(height: 2.h),
          const GlobalBottomSheetDragLine(),
          SizedBox(height: 3.h),
          Container(
            height: 8.h,
            width: 8.h,
            padding: context.paddingAll16,
            decoration: AppBoxDecorations.kBonusBoxDecoration(context),
            child: SvgPicture.asset(AppAssets.bell),
          ),
          SizedBox(height: 2.4.h),
          Text(
            appLocalizations.standartCardReady,
            style: AppTextStyles.kMiniHeaderTextStyle,
          ),
          SizedBox(height: 2.4.h),
        ],
      ),
      content: Text(
        appLocalizations.cardShippingAddress,
        textAlign: TextAlign.center,
        style: AppTextStyles.kAlertSubtitleStyle,
      ),
      actions: [
        SizedBox(height: 2.h),
        Center(
          child: GlobalButton(
            buttonTap: () {},
            buttonText: appLocalizations.isClear,
          ),
        ),
      ],
    );
  }
}

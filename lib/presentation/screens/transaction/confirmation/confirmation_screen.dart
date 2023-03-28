import 'package:bank_of_baku_app/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/constants/app_routes.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../widgets/global_appbar.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_dotted_box.dart';
import '../../../widgets/global_empty_size.dart';
import '../landlines/landlines_screen.dart';
import 'widgets/confirm_info_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: GlobalAppBar(titleText: appLocalizations.confirmation),
        body: Container(
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          padding: context.paddingHorizontal16Top24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizations.checkTransferInfo,
                style: TextStyle(
                    color: AppColors.instance.textBlackColor,
                    fontSize: 16.95.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.31),
              ),
              SizedBox(height: 2.63.h),
              GlobalDottedBox(
                title: appLocalizations.universal,
                subtitle: 'AZ23ACAB01350112356332',
                trailing: '10520.00',
                icon: SvgPicture.asset(AppAssets.azValuta),
                isActive: false,
              ),
              SizedBox(height: 2.63.h),
              GlobalDottedBox(
                title: 'Lev Tolstoy',
                subtitle: 'AZ23ACAB01350112356332',
                trailing: 'Fərdi',
                icon: Image.asset(AppAssets.kapitalBank),
              ),
              SizedBox(height: 2.1.h),
              ConfirmInfoTextWidget(
                  labelText: appLocalizations.salary, text: '700.00 ₼'),
              ConfirmInfoTextWidget(
                  labelText: appLocalizations.commision, text: '0.00 ₼'),
              ConfirmInfoTextWidget(
                  labelText: appLocalizations.commonSalary, text: '700.00 ₼'),
              const GlobalEmptySize(),
              GlobalButton(
                buttonText: '${appLocalizations.transfer} 700.00 ₼',
                buttonTap: () {
                  AppRoutes.to(context, const LandlinesScreen());
                },
              ),
              SizedBox(height: 2.63.h),
            ],
          ),
        ),
      ),
    );
  }
}

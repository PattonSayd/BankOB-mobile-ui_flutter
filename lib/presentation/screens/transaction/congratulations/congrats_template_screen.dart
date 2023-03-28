import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/bank_accounts/bank_accounts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/constants/app_routes.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_strut_styles.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_empty_size.dart';
import '../../../widgets/global_header_text.dart';
import '../../../widgets/global_text_button.dart';

class CongratsTemplateScreen extends StatelessWidget {
  const CongratsTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        body: Padding(
          padding: context.paddingHorizontal24,
          child: Column(
            children: [
              const GlobalEmptySize(),
              SvgPicture.asset(AppAssets.congratulations),
              SizedBox(height: 5.26.h),
              const GlobalHeaderText(headerText: 'Şablon hazırdır!'),
              SizedBox(height: 3.16.h),
              Text(
                'Odənişlərin mütəmadi həyata keçiriləcək',
                style: AppTextStyles.kYouCanEnterToAppTextStyle,
                strutStyle: AppStrutStyles.kBodyM,
              ),
              SizedBox(height: 1.05.h),
              Text(
                'Sablon novu - Standard',
                style: AppTextStyles.kYouCanEnterToAppTextStyle,
                strutStyle: AppStrutStyles.kBodyM,
              ),
              const GlobalEmptySize(),
              GlobalButton(
                buttonText: 'Bütün şablonlar',
                buttonTap: () {
                  // AppRoutes.to(context, const MainScreen());
                  AppRoutes.to(context, const BankAccountsScreen());
                },
              ),
              SizedBox(height: 1.05.h),
              GlobalTextButton(
                buttonText: appLocalizations.saveAsATemplate,
                buttonTap: () {},
              ),
              SizedBox(height: 2.1.h),
            ],
          ),
        ),
      ),
    );
  }
}

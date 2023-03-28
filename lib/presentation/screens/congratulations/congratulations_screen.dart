import 'package:bank_of_baku_app/presentation/screens/transaction/bank_accounts/bank_accounts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/constants/app_routes.dart';
import '../../../app/extensions/context_extension.dart';
import '../../../app/styles/app_box_decorations.dart';
import '../../../app/styles/app_text_styles.dart';
import '../../widgets/global_button.dart';
import '../../widgets/global_empty_size.dart';
import '../../widgets/global_header_text.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

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
              GlobalHeaderText(headerText: appLocalizations.congratulations),
              SizedBox(height: 3.16.h),
              Text(
                appLocalizations.youCanEnterAppText,
                style: AppTextStyles.kYouCanEnterToAppTextStyle,
              ),
              const GlobalEmptySize(),
              GlobalButton(
                buttonText: appLocalizations.continueButton,
                buttonTap: () {
                  // AppRoutes.to(context, const MainScreen());
                  AppRoutes.to(context, const BankAccountsScreen());
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

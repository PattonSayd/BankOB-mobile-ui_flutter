import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/constants/app_routes.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_shadow.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../widgets/global_appbar.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_separator.dart';
import '../../../widgets/global_text_button.dart';
import '../transfer_date/transfer_date_screen.dart';
import 'widgets/receipt_info_text_widget.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: GlobalAppBar(titleText: appLocalizations.receipt),
        body: Container(
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          padding: context.paddingTop24,
          child: SingleChildScrollView(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: '720',
                    style: TextStyle(
                      color: AppColors.instance.textBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 25.45.sp, //36px
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '.00 ₼',
                        style: TextStyle(
                          color: AppColors.instance.textBlackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.75.sp, //24px
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.05.h),
                Text(
                  appLocalizations.moneyTransfers,
                  style: TextStyle(
                    color: AppColors.instance.confirmLabelColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.95.sp,
                    letterSpacing: -0.31,
                  ),
                ),
                SizedBox(height: 3.16.h),
                const GlobalSeparator(),
                SizedBox(height: 3.16.h),
                Stack(
                  children: [
                    Padding(
                      padding: context.paddingHorizontal16,
                      child: Column(
                        children: const [
                          ReceiptInfoTextWidget(
                            labelText: 'Отправитель',
                            text: 'AZ23ACAB01350112356332',
                          ),
                          ReceiptInfoTextWidget(
                            labelText: 'Получатель',
                            text: 'AZ23ACAB01350112356332',
                          ),
                          ReceiptInfoTextWidget(
                            labelText: 'Описание',
                            text: 'Olke daxili',
                          ),
                          ReceiptInfoTextWidget(
                            labelText: 'Дата и время',
                            text: '02.07.2022 - 17:00',
                          ),
                          ReceiptInfoTextWidget(
                            labelText: 'Статус операции',
                            text: 'Успешно',
                          ),
                          ReceiptInfoTextWidget(
                            labelText: '№ чека',
                            text: '1123563',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 3.95.h,
                      bottom: 2.82.h,
                      child: Image.asset(AppAssets.traced),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: context.paddingHorizontal16,
          decoration: BoxDecoration(
            color: AppColors.instance.cardColor,
            boxShadow: [AppShadow.buttonsBackgroundShadow],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 2.1.h),
              GlobalButton(
                buttonText: appLocalizations.share,
                buttonTap: () {
                  AppRoutes.to(
                    context,
                    TransferDateScreen(),
                  );
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

import 'package:bank_of_baku_app/presentation/screens/transaction/dynamic_%20deposit/viewmodels/dynamic_deposit_model.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/dynamic_%20deposit/widgets/dynamic_deposit_widget.dart';
import 'package:flutter/material.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/constants/app_routes.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_strut_styles.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../widgets/global_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/global_button.dart';
import '../../../widgets/global_text_button.dart';
import '../transfer_date/transfer_date_screen.dart';

class DynamicDepositScreen extends StatefulWidget {
  const DynamicDepositScreen({super.key});

  @override
  State<DynamicDepositScreen> createState() => _DynamicDepositScreenState();
}

class _DynamicDepositScreenState extends State<DynamicDepositScreen> {
  late final List<DynamicDepositModel> _dynamicDepositItems;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();

    _dynamicDepositItems = [
      DynamicDepositModel(
        icon: AppAssets.monetaryUnit,
        title: 'Valyuta',
        descript: 'AZN, USD, EUR',
      ),
      DynamicDepositModel(
        icon: AppAssets.minimumAmount,
        title: 'Minimal məbləğ',
        descript: '500.00 ₼',
      ),
      DynamicDepositModel(
        icon: AppAssets.interestRate,
        title: 'Faiz dərəcəsi',
        descript: '11%',
      ),
      DynamicDepositModel(
        icon: AppAssets.duration,
        title: 'Müddət',
        descript: '6-24 ay',
      ),
      DynamicDepositModel(
        icon: AppAssets.paymentOfInterest,
        title: 'Faizlərin ödənişi',
        descript: 'Aylıq və ya müddətin sonunda',
      ),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  static TextStyle get kDynamicDepositMainTitle => TextStyle(
        color: const Color(0xFF2D3940),
        fontWeight: FontWeight.w500,
        fontSize: 17.45.sp,
        letterSpacing: -0.31,
      );

  static TextStyle get kDynamicDepositMainText => TextStyle(
        color: const Color(0xFF2D3940),
        fontWeight: FontWeight.w400,
        fontSize: 15.85.sp,
        letterSpacing: -0.15,
      );

  static TextStyle get kDynamicDepositDescription => TextStyle(
        color: const Color(0xFF2D3940),
        fontWeight: FontWeight.w400,
        fontSize: 16.95.sp,
        letterSpacing: -0.31,
      );

  static TextStyle get kCheckTarifButton => TextStyle(
        color: const Color(0xFF00A3C9),
        fontWeight: FontWeight.w500,
        fontSize: 15.85.sp,
      );

  @override
  Widget build(BuildContext context) {
    const double padding = 24;
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: const GlobalAppBar(titleText: 'Dinamik depozit'),
        body: Container(
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          padding: context.paddingHorizontal16Top24,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.deviceWidth,
                  height: 23.70.h,
                  padding: const EdgeInsets.symmetric(
                      horizontal: padding, vertical: 33),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E4F6),
                    borderRadius: context.borderRadiusAll12,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: context.deviceWidth / 2 - (padding * 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dinamik depozit',
                                style: kDynamicDepositMainTitle,
                                strutStyle:
                                    AppStrutStyles.dynamicDepositMainTitle,
                              ),
                              SizedBox(height: 1.05.h),
                              Text(
                                'Tellus eu at nunc tincidunt. Ut nam elit felis integer!',
                                style: kDynamicDepositMainText,
                                strutStyle: AppStrutStyles.kBodyS,
                                maxLines: 3,
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          AppAssets.piggyBank,
                        )
                      ]),
                ),
                SizedBox(
                  height: 3.16.h,
                ),
                Text(
                  'Sollicitudin elit sit bibendum urna turpis vestibulum, habitant vel.',
                  style: kDynamicDepositDescription,
                  strutStyle: AppStrutStyles.kBodyM,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _dynamicDepositItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: context.paddingVertical16,
                      child: DynamicDepositWidget(
                          dynamicDepositItems: _dynamicDepositItems[index]),
                    );
                  },
                  separatorBuilder: (context, index) => const DividerTheme(
                    data: DividerThemeData(space: 0),
                    child: Divider(
                      thickness: 0.5,
                      color: Color(0xFFF0F2F2),
                    ),
                  ),
                ),
                SizedBox(height: 2.1.h),
                Text(
                  'Check out all tariffs',
                  style: kCheckTarifButton,
                  strutStyle: AppStrutStyles.kBodyS,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: context.paddingHorizontal16,
          decoration: BoxDecoration(
            color: AppColors.instance.cardColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 2.1.h),
              GlobalButton(
                buttonText: 'Order deposit',
                buttonTap: () {
                  AppRoutes.to(
                    context,
                    TransferDateScreen(),
                  );
                },
              ),
              SizedBox(height: 1.05.h),
              GlobalTextButton(
                buttonText: 'Kalkulyator',
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

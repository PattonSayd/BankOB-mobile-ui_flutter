import 'package:bank_of_baku_app/app/constants/app_assets.dart';
import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/confirmation/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_routes.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/global/global_bottom_sheet.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../widgets/global_appbar.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_dropdown_button.dart';
import '../../../widgets/global_empty_size.dart';
import '../../../widgets/global_text_fileds.dart';

class CashByCodeScreen extends StatefulWidget {
  const CashByCodeScreen({super.key});

  @override
  State<CashByCodeScreen> createState() => _CashByCodeScreenState();
}

class _CashByCodeScreenState extends State<CashByCodeScreen> {
  late AppLocalizations appLocalizations;
  late final TextEditingController amountController;
  late final FocusNode amountFocus;
  late final TextEditingController sendNumController;
  late final FocusNode sendNumFocus;
  late final TextEditingController receiptNumController;
  late final FocusNode receiptNumFocus;
  final List currencyList = ['AZN', 'EUR', 'USD'];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    sendNumController = TextEditingController();
    sendNumFocus = FocusNode();
    receiptNumController = TextEditingController();
    receiptNumFocus = FocusNode();
    amountController = TextEditingController(text: '10.00');
    amountFocus = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    sendNumController.dispose();
    sendNumFocus.dispose();
    receiptNumController.dispose();
    receiptNumFocus.dispose();
    amountController.dispose();
    amountFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: GlobalAppBar(titleText: appLocalizations.cashByCode),
        body: Container(
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          padding: context.paddingHorizontal16Top24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalTextField(
                labelText: appLocalizations.senderNumber,
                inputController: sendNumController,
                inputFocus: sendNumFocus,
                iconData: AppAssets.userLogoForInput,
              ),
              SizedBox(height: 2.63.h),
              GlobalTextField(
                labelText: appLocalizations.recieverNumber,
                inputController: receiptNumController,
                inputFocus: receiptNumFocus,
              ),
              SizedBox(height: 2.63.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: GlobalTextField(
                      labelText: appLocalizations.salary,
                      inputController: amountController,
                      inputFocus: amountFocus,
                    ),
                  ),
                  SizedBox(width: 1.58.h),
                  Expanded(
                    flex: 4,
                    child: GlobalDropDownButton(
                      // hintText: appLocalizations.concurrency,
                      labelText: appLocalizations.concurrency,
                      dropdownItems: [currencyList[currentIndex]],
                      onTap: () {
                        GlobalBottomSheet.showGlobalModal(
                          context,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select currency',
                                style: TextStyle(
                                  color: AppColors.instance.textBlackColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.45,
                                  fontSize: 18.95.sp,
                                ),
                              ),
                              SizedBox(height: 1.8.h),
                              ListView.separated(
                                itemCount: currencyList.length,
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => Container(
                                  color: AppColors.instance.dividerColor,
                                  height: 1,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Text(
                                        currencyList[index],
                                        style: TextStyle(
                                          color:
                                              AppColors.instance.textBlackColor,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.31,
                                          fontSize: 16.95.sp,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 2.4.h),
              Text(
                'Check out all tariffs',
                style: TextStyle(
                  color: AppColors.instance.primaryColor,
                  fontSize: 15.85.sp,
                  fontWeight: FontWeight.w500,
                ),
                strutStyle: AppStrutStyles.kBodyS,
              ),
              const GlobalEmptySize(),
              GlobalButton(
                  buttonText: appLocalizations.continueButton,
                  buttonTap: () {
                    AppRoutes.to(context, const ConfirmationScreen());
                  }),
              SizedBox(height: 2.63.h),
            ],
          ),
        ),
      ),
    );
  }
}

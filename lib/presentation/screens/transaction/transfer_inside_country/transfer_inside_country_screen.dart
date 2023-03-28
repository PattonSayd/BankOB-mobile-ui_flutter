import 'package:bank_of_baku_app/app/styles/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_routes.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../widgets/global_appbar.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_checkbox.dart';
import '../../../widgets/global_dropdown_button.dart';
import '../../../widgets/global_text_fileds.dart';
import '../../main/widgets/dotted_box.dart';
import '../transfer/transfer_list_screen.dart';

class TransferInsideCountryScreen extends StatefulWidget {
  const TransferInsideCountryScreen({super.key});

  @override
  State<TransferInsideCountryScreen> createState() =>
      _TransferInsideCountryScreenState();
}

class _TransferInsideCountryScreenState
    extends State<TransferInsideCountryScreen> {
  late AppLocalizations appLocalizations;
  late final TextEditingController amountController;
  late final FocusNode amountFocus;
  late final TextEditingController budgetClassController;
  late final FocusNode budgetClassFocus;
  late final TextEditingController transferClassController;
  late final FocusNode transferClassFocus;
  late final TextEditingController moreInfoController;
  late final FocusNode moreInfoFocus;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    amountFocus = FocusNode();
    budgetClassController = TextEditingController();
    budgetClassFocus = FocusNode();
    transferClassController = TextEditingController();
    transferClassFocus = FocusNode();
    moreInfoController = TextEditingController();
    moreInfoFocus = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    amountFocus.dispose();
    budgetClassController.dispose();
    budgetClassFocus.dispose();
    transferClassController.dispose();
    transferClassFocus.dispose();
    moreInfoController.dispose();
    moreInfoFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: GlobalAppBar(titleText: appLocalizations.inCountry),
        body: Container(
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          padding: context.paddingHorizontal16Top24,
          child: ListView(
            children: [
              _DottedWidget(
                title: appLocalizations.sender,
                dotterTitle: appLocalizations.chooseProperAccount,
                borderRadius: 8,
                dottedButtonSize: 4.21.h,
              ),
              SizedBox(height: 2.63.h),
              _DottedWidget(
                title: appLocalizations.reciever,
                dotterTitle: appLocalizations.getterAccountAndInfo,
                borderRadius: 8,
                dottedButtonSize: 4.21.h,
              ),
              SizedBox(height: 2.63.h),
              GlobalTextField(
                labelText: appLocalizations.salary,
                inputController: amountController,
                inputFocus: amountFocus,
              ),
              SizedBox(height: 2.63.h),
              GlobalTextField(
                labelText: appLocalizations.budgeClassification,
                inputController: budgetClassController,
                inputFocus: budgetClassFocus,
              ),
              SizedBox(height: 2.63.h),
              GlobalDropDownButton(
                // hintText: appLocalizations.budgeLevel,
                labelText: appLocalizations.budgeLevel,
                dropdownItems: const ['Universal'],
              ),
              SizedBox(height: 2.63.h),
              GlobalTextField(
                labelText: appLocalizations.transferClassification,
                inputController: transferClassController,
                inputFocus: transferClassFocus,
              ),
              SizedBox(height: 2.63.h),
              GlobalTextField(
                labelText: appLocalizations.additionalInfo,
                inputController: moreInfoController,
                inputFocus: moreInfoFocus,
              ),
              SizedBox(height: 2.89.h),
              Row(
                children: [
                  const GlobalCheckBox(),
                  SizedBox(width: 0.92.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: appLocalizations.urgentOrder,
                          style: TextStyle(
                            color: const Color(0xff797E80),
                            fontWeight: FontWeight.w400,
                            fontSize: 15.85.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' +15 ₼',
                          style: TextStyle(
                            color: AppColors.instance.textBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.85.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.1.h),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding:
              EdgeInsets.only(bottom: 2.63.h, top: 2.h, left: 2.h, right: 2.h),
          decoration: BoxDecoration(
            color: AppColors.instance.cardColor,
            boxShadow: [AppShadow.buttonsBackgroundShadow],
          ),
          child: GlobalButton(
            buttonText: appLocalizations.continueButton,
            buttonTap: () {
              AppRoutes.to(context, const TransferListScreen());
            },
          ),
        ),
      ),
    );
  }
}

class _DottedWidget extends StatelessWidget {
  final String title;
  final String dotterTitle;
  final double dottedButtonSize;
  final double borderRadius;
  const _DottedWidget({
    Key? key,
    required this.title,
    required this.dotterTitle,
    required this.dottedButtonSize,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.65.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.instance.transferHistorySubtitleTextColor,
          ),
        ),
        SizedBox(height: 0.92.h),
        DottedBox(
          title: dotterTitle,
          dottedButtonSize: dottedButtonSize,
          borderRadius: borderRadius,
          onPress: () {},
        ),
      ],
    );
  }
}

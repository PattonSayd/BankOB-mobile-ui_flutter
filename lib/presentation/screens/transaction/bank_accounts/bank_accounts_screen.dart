import 'package:bank_of_baku_app/app/styles/app_text_styles.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/cash_by_code/cash_by_code.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_button.dart';
import 'package:flutter/material.dart';

import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_routes.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../widgets/global_appbar.dart';
import '../../../widgets/global_text_fileds.dart';
import '../../main/widgets/dotted_box.dart';

class BankAccountsScreen extends StatefulWidget {
  const BankAccountsScreen({super.key});

  @override
  State<BankAccountsScreen> createState() => _BankAccountsScreenState();
}

class _BankAccountsScreenState extends State<BankAccountsScreen> {
  late AppLocalizations appLocalizations;
  late final TextEditingController amountController;
  late final FocusNode amountFocus;
  late final TextEditingController transferClassController;
  late final FocusNode transferClassFocus;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    amountFocus = FocusNode();
    transferClassController = TextEditingController();
    transferClassFocus = FocusNode();
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
    transferClassController.dispose();
    transferClassFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: GlobalAppBar(titleText: appLocalizations.bankAccounts),
        body: Container(
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          padding: context.paddingHorizontal16Top24,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        _DottedWidget(
                          title: appLocalizations.sender,
                          dotterTitle: appLocalizations.chooseProperAccount,
                          borderRadius: 8,
                          dottedButtonSize: 32,
                        ),
                        SizedBox(height: 2.63.h),
                        _DottedWidget(
                          title: appLocalizations.reciever,
                          dotterTitle: appLocalizations.getterAccountAndInfo,
                          borderRadius: 8,
                          dottedButtonSize: 32,
                        ),
                        SizedBox(height: 2.63.h),
                        GlobalTextField(
                          labelText: appLocalizations.salary,
                          inputController: amountController,
                          inputFocus: amountFocus,
                        ),
                        SizedBox(height: 2.63.h),
                        GlobalTextField(
                          labelText: appLocalizations.transferClassification,
                          inputController: transferClassController,
                          inputFocus: transferClassFocus,
                        ),
                        SizedBox(height: 2.63.h),
                        Text(
                          appLocalizations.noneWorkDayInfo,
                          style: AppTextStyles.kNoneWorkDayInfoTextStyle,
                          strutStyle: const StrutStyle(leading: 0.25),
                        ),
                        SizedBox(height: 9.21.h),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(bottom: 2.63.h),
                  child: GlobalButton(
                    buttonText: appLocalizations.continueButton,
                    buttonTap: () {
                      AppRoutes.to(context, const CashByCodeScreen());
                    },
                  ),
                ),
              ),
            ],
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
          style: Theme.of(context).textTheme.caption!.merge(
                AppTextStyles.kDottedTitleTextStyle,
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

import 'package:bank_of_baku_app/presentation/screens/transaction/transfer_template/widgets/automatical_template_widget.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/transfer_template/widgets/standard_template_widget.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../widgets/global_appbar.dart';
import '../../../widgets/global_button.dart';
import '../../main/viewmodels/tab_bar_item_model.dart';
import '../../main/widgets/tab_bar_item_widget.dart';
import '../../main/widgets/tab_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransferTemplateScreen extends StatefulWidget {
  const TransferTemplateScreen({Key? key}) : super(key: key);

  @override
  State<TransferTemplateScreen> createState() => _TransferTemplateScreenState();
}

class _TransferTemplateScreenState extends State<TransferTemplateScreen> {
  int tabIndex = 0;
  final List<TabBarItemModel> _tabBarItems = [
    TabBarItemModel(text: "Standart"),
    TabBarItemModel(text: "Avtomatik"),
  ];

  TextStyle get kTemplateTitleStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.15,
      );

  TextStyle get kTemplateSubtitleStyle => const TextStyle(
        color: Color(0xff797E80),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get kTemplatePriceStyle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF000000),
        letterSpacing: -0.31,
      );

  TextStyle get kTemplateSubPriceStyle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF797E80),
      );

  BoxDecoration kItemDecoration(BuildContext context) => BoxDecoration(
      color: AppColors.instance.bonusBoxColor,
      borderRadius: context.borderRadiusAll8,
      border: Border.all(
        width: 1,
        style: BorderStyle.solid,
        color: AppColors.instance.bonusBoxBorderColor,
      ));

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: GlobalAppBar(
            titleText: appLocalizations.transferHistory,
            actionIcon: AppAssets.dateSort),
        body: Column(
          children: [
            const SizedBox(height: 10),
            TabBarWidget(
              tabBarItems: _tabBarItems,
              onReturn: (index) => TabBarItemWidget(
                width: (context.deviceWidth - (16 * 2)) / 2,
                isActive: tabIndex == index,
                tabBarItem: _tabBarItems[index],
                onTap: () => setState(() => tabIndex = index),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: IndexedStack(
                index: tabIndex,
                children: [
                  StandardTemplateWidget(),
                  AvtomaticalTemplateWidget(),
                ],
              ),
            ),
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 20),
                child:
                    GlobalButton(buttonText: "New template", buttonTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

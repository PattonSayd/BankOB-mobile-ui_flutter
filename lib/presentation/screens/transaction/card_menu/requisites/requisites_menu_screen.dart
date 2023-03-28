import 'package:bank_of_baku_app/presentation/screens/transaction/card_menu/requisites/viewmodels/requisites_menu_item_model.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/card_menu/widgets/menu_item_widget.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_empty_size.dart';
import 'package:flutter/material.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/styles/app_box_decorations.dart';
import '../../../../widgets/global_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../widgets/global_button.dart';

class RequisitesMenuScreen extends StatefulWidget {
  const RequisitesMenuScreen({super.key});

  @override
  State<RequisitesMenuScreen> createState() => _RequisitesMenuScreenState();
}

class _RequisitesMenuScreenState extends State<RequisitesMenuScreen> {
  late final List<RequisitesMenuItemModel> _requisitesMenuItems;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();

    _requisitesMenuItems = [
      RequisitesMenuItemModel(title: 'Valyuta', subTitle: 'AZN'),
      RequisitesMenuItemModel(
          title: 'Alanın adı', subTitle: 'Ахвердиев Али Алиевич'),
      RequisitesMenuItemModel(title: 'SWIFT', subTitle: 'IBAZAX2X'),
      RequisitesMenuItemModel(
          title: 'Kartın hesab nömrəsi (IBAN)',
          subTitle: 'AZ10NABZ01350100000000056944'),
      RequisitesMenuItemModel(
          title: 'Bank hesabının nömrəsi (IBAN)',
          subTitle: 'AZ10NABZ01350100000000056944'),
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

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: AppBoxDecorations.kScaffoldDecoration(context),
        child: Scaffold(
          appBar: const GlobalAppBar(titleText: 'Rekvizitlər'),
          body: Container(
            decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
            padding: context.paddingHorizontal16Top24,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _requisitesMenuItems.length,
                  itemBuilder: (context, index) {
                    return MenuItemWidget(
                      menuItems: _requisitesMenuItems[index],
                    );
                  },
                ),
                const GlobalEmptySize(),
                GlobalButton(buttonText: 'Share', buttonTap: () {}),
                SizedBox(height: 2.1.h),
              ],
            ),
          ),
        ));
  }
}

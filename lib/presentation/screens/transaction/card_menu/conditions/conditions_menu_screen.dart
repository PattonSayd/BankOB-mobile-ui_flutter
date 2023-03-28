import 'package:bank_of_baku_app/presentation/screens/transaction/card_menu/conditions/viewmodels/conditions_menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';

import '../../../../../app/styles/app_box_decorations.dart';
import '../../../../widgets/global_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/menu_item_widget.dart';

class ConditionsMenuScreen extends StatefulWidget {
  const ConditionsMenuScreen({super.key});

  @override
  State<ConditionsMenuScreen> createState() => _ConditionsMenuScreenState();
}

class _ConditionsMenuScreenState extends State<ConditionsMenuScreen> {
  late final List<ConditionsMenuItemModel> _conditionsMenuItems;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();

    _conditionsMenuItems = [
      ConditionsMenuItemModel(title: 'Kreditin novu', subTitle: 'Nagd pul'),
      ConditionsMenuItemModel(title: 'Kredit', subTitle: 'Avtomobil'),
      ConditionsMenuItemModel(title: 'Valyuta', subTitle: 'AZN'),
      ConditionsMenuItemModel(title: 'Mebleq', subTitle: '5 700'),
      ConditionsMenuItemModel(title: 'Faiz dərəcəsi', subTitle: '11%'),
      ConditionsMenuItemModel(title: 'Muddet', subTitle: '12 ay'),
      ConditionsMenuItemModel(
          title: 'Verildiyi filial', subTitle: 'Sabail filiali'),
      ConditionsMenuItemModel(title: 'Verilme tarixi', subTitle: '07.05.2022'),
      ConditionsMenuItemModel(title: 'Bitme tarixi', subTitle: '07.0.7.2023'),
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
          appBar: const GlobalAppBar(titleText: 'Şərtlər'),
          body: Container(
            decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
            padding: context.paddingHorizontal16Top24,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _conditionsMenuItems.length,
              itemBuilder: (context, index) {
                return MenuItemWidget(menuItems: _conditionsMenuItems[index]);
              },
            ),
          ),
        ));
  }
}

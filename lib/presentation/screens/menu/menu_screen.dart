import 'package:bank_of_baku_app/presentation/screens/menu/viewmodels/menu_item_model.dart';
import 'package:bank_of_baku_app/presentation/screens/menu/widgets/menu_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/styles/app_box_decorations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/themes/app_colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late final List<MenuItemModel> _menuItems;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();

    _menuItems = [
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Products',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Bonuses',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Balance',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Online queue',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'For you',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'History',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Service network',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Settings?',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Contact',
      ),
      MenuItemModel(
        icon: AppAssets.bonusMenuIcon,
        title: 'FAQ',
      ),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingHorizontal16Top24,
      decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
      child: ListView(
        children: [
          Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemCount: _menuItems.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => DividerTheme(
                  data: const DividerThemeData(space: 0),
                  child: Divider(
                    thickness: 0.5,
                    color: AppColors.instance.dividerColor,
                  ),
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: MenuItemsWidget(menuItem: _menuItems[index]),
                    onTap: () {},
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/extensions/context_extension.dart';
import '../../../app/styles/app_box_decorations.dart';
import '../../widgets/global_bottom_nav_bar.dart';
import '../menu/menu_screen.dart';
import '../payments/payments_screen.dart';
import '../transaction/transfer/transfer_screen.dart';
import 'viewmodels/bonus_item_model.dart';
import 'viewmodels/bottom_nav_bar_item_model.dart';
import 'viewmodels/for_you_item_model.dart';
import 'viewmodels/mini_account_item_model.dart';
import 'viewmodels/mini_card_item_model.dart';
import 'viewmodels/mini_credit_item_model.dart';
import 'viewmodels/mini_deposit_item_model.dart';
import 'viewmodels/tab_bar_item_model.dart';
import 'viewmodels/template_item_model.dart';
import 'viewmodels/top_pick_item_model.dart';
import 'widgets/bonus_item_widget.dart';
import 'widgets/category_widget.dart';
import 'widgets/dotted_box.dart';
import 'widgets/for_you_item_widget.dart';
import 'widgets/main_app_bar.dart';
import 'widgets/mini_account_item_widget.dart';
import 'widgets/mini_card_item_widget.dart';
import 'widgets/mini_card_widget.dart';
import 'widgets/mini_credit_item_widget.dart';
import 'widgets/mini_deposit_item_widget.dart';
import 'widgets/tab_bar_item_widget.dart';
import 'widgets/tab_bar_widget.dart';
import 'widgets/tepmlate_item_widget.dart';
import 'widgets/top_pick_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int tabIndex = 0;
  int navBarIndex = 0;
  bool showTemplate = false;
  late final List<TabBarItemModel> _tabBarItems;
  late final List<TemplateItemModel> _templateItems;
  late final List<BonusItemModel> _bonusItems;
  late final List<TopPickItemModel> _topPickItems;
  late final List<ForYouItemModel> _forYouItems;
  late final List<BottomNavBarItemModel> _bottomNavBarItems;
  late final List<MiniCardItemModel> _miniCards;
  late final List<MiniAccountItemModel> _miniAccounts;
  late final List<MiniCreditItemModel> _miniCredits;
  late final List<MiniDepositItemModel> _miniDeposits;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    _tabBarItems = [
      TabBarItemModel(text: "Kartlar"),
      TabBarItemModel(text: "Hesablar"),
      TabBarItemModel(text: "Kreditler"),
      TabBarItemModel(text: "Əmanətlər"),
    ];
    _templateItems = [
      TemplateItemModel(icon: AppAssets.bakcellLogo, title: 'Bakcell'),
      TemplateItemModel(icon: AppAssets.azerisiqLogo, title: 'Azərişıq'),
      TemplateItemModel(icon: AppAssets.katvLogo, title: 'Katv 1'),
      TemplateItemModel(icon: AppAssets.azercellLogo, title: 'Azercell'),
      TemplateItemModel(icon: AppAssets.bakcellLogo, title: 'Bakcell'),
      TemplateItemModel(icon: AppAssets.azerisiqLogo, title: 'Azərişıq'),
      TemplateItemModel(icon: AppAssets.katvLogo, title: 'Katv 1'),
      TemplateItemModel(icon: AppAssets.azercellLogo, title: 'Azercell'),
    ];
    _bonusItems = [
      BonusItemModel(AppAssets.gift, '27.00 ₼', 'Bolkart Plus'),
      BonusItemModel(AppAssets.bolkart, '3.47 ₼', 'EDV geri al'),
      BonusItemModel(AppAssets.edv, '1072 bonus', 'Dostbank xal'),
    ];
    _topPickItems = [
      TopPickItemModel(AppAssets.credit, 'Credit ', 'Best conditions'),
      TopPickItemModel(AppAssets.deposit, 'Deposit ', 'Save your money'),
      TopPickItemModel(AppAssets.card, 'Card ', 'Apply now'),
      TopPickItemModel(AppAssets.card, 'Account ', 'Apply now'),
    ];
    _forYouItems = [
      ForYouItemModel(
          AppAssets.fingerprint, '“Dinamic” deposit ', 'Min. 500 ₼, 11% illik'),
      ForYouItemModel(
          AppAssets.fingerprint, 'Automobile credit ', 'Mak. 25 000 ₼, 16%'),
    ];
    _bottomNavBarItems = [
      BottomNavBarItemModel(AppAssets.main, 'Main'),
      BottomNavBarItemModel(AppAssets.payments, 'Payments'),
      BottomNavBarItemModel(AppAssets.transfers, 'Transfers'),
      BottomNavBarItemModel(AppAssets.qrScan, 'QR scan'),
      BottomNavBarItemModel(AppAssets.menu, 'Menu'),
    ];
    _miniCards = [
      MiniCardItemModel(
        AppAssets.universalCard,
        '245.23',
        '₼',
        '*2814',
        'Universal Card',
      ),
      MiniCardItemModel(
        AppAssets.visaBlackCard,
        '1 112.73',
        '\$',
        '*1233',
        'My Card',
      ),
      MiniCardItemModel(
        AppAssets.visaYellowCard,
        '812.23',
        '\$',
        '*1742',
        'Visa Infinite',
      ),
    ];
    _miniAccounts = [
      MiniAccountItemModel(
        AppAssets.blueGradient,
        '245.23',
        '₼',
        'Universal Card',
      ),
      MiniAccountItemModel(
        AppAssets.darkGreenGradient,
        '1 112.73',
        '₼',
        'Personal',
      ),
      MiniAccountItemModel(
        AppAssets.lightGreenGradient,
        '812.23',
        '₼',
        'Universal Card',
      ),
    ];
    _miniCredits = [
      MiniCreditItemModel(
        AppAssets.blueGradient,
        '245.23',
        '₼',
        '720.00 ödəniş',
        'Dovlet ve ozel...',
      ),
      MiniCreditItemModel(
        AppAssets.darkGreenGradient,
        '1 112.73',
        '₼',
        '720.00 ödəniş',
        'Dovlet ve ozel...',
      ),
      MiniCreditItemModel(
        AppAssets.lightGreenGradient,
        '812.23',
        '₼',
        '720.00 ödəniş',
        'Dovlet ve ozel...',
      ),
    ];
    _miniDeposits = [
      MiniDepositItemModel(
        AppAssets.blueGradient,
        '245.23',
        '₼',
        '11% dərəcəsi',
        'Manat',
      ),
      MiniDepositItemModel(
        AppAssets.darkGreenGradient,
        '1 112.73',
        '₼',
        '11% dərəcəsi',
        'Manat',
      ),
      MiniDepositItemModel(
        AppAssets.lightGreenGradient,
        '812.23',
        '₼',
        '11% dərəcəsi',
        'Manat',
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
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: const MainAppBar(),
        body: IndexedStack(
          index: navBarIndex,
          children: [
            _builMainPageWidget,
            const PaymentsScreen(),
            const TransferScreen(),
            const Center(child: Text('QR Scan')),
            const MenuScreen()
          ],
        ),
        bottomNavigationBar: GlobalBottomNavBar(
          bottomNavBarItems: _bottomNavBarItems,
          navBarIndex: navBarIndex,
          onTap: (int index) {
            navBarIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget get _builMainPageWidget => Column(
        children: [
          SizedBox(height: 2.h),
          IndexedStack(
            index: tabIndex,
            children: [
              MiniCardWidget(
                miniCardsList: _miniCards,
                onReturn: (index) => MiniCardItemWidget(
                  miniCard: _miniCards[index],
                  isLastItem: index == _miniCards.length - 1, //remark
                ),
              ),
              MiniCardWidget(
                miniCardsList: _miniAccounts,
                onReturn: (index) => MiniAccountItemWidget(
                  miniAccount: _miniAccounts[index],
                  isLastItem: index == _miniAccounts.length - 1,
                ),
              ),
              MiniCardWidget(
                miniCardsList: _miniCredits,
                onReturn: (index) => MiniCreditItemWidget(
                  miniCredit: _miniCredits[index],
                  isLastItem: index == _miniCredits.length - 1,
                ),
              ),
              MiniCardWidget(
                miniCardsList: _miniDeposits,
                onReturn: (index) => MiniDepositItemWidget(
                  miniDeposit: _miniDeposits[index],
                  isLastItem: index == _miniDeposits.length - 1,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.6.h),
          TabBarWidget(
            tabBarItems: _tabBarItems,
            onReturn: (index) => TabBarItemWidget(
              isActive: tabIndex == index,
              tabBarItem: _tabBarItems[index],
              onTap: () => setState(() => tabIndex = index),
            ),
          ),
          SizedBox(height: 2.6.h),
          Expanded(
            child: Container(
              padding: context.paddingTop24,
              decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
              child: ListView(
                children: [
                  SizedBox(height: 0.52.h), //remark
                  showTemplate
                      ? CategoryWidget(
                          listHeight: 11.5.h,
                          categoryTitle: appLocalizations.templates,
                          isArrow: true,
                          modelList: _templateItems,
                          onReturn: (index) => TemplateItemWidget(
                            templateItem: _templateItems[index],
                            isLastItem: index == _templateItems.length - 1,
                          ),
                        )
                      : Padding(
                          padding: context.paddingHorizontal16,
                          child: DottedBox(
                            title: appLocalizations.addTemplates,
                            subtitle: appLocalizations.makeYourPaymentEasy,
                            onPress: () {
                              showTemplate = true;
                              setState(() {});
                            },
                          ),
                        ),
                  SizedBox(height: 3.16.h), //remark+++
                  CategoryWidget(
                    listHeight: 17.h,
                    categoryTitle: appLocalizations.bonuses,
                    modelList: _bonusItems,
                    onReturn: (index) => BonusItemWidget(
                      bonusItem: _bonusItems[index],
                    ),
                  ),
                  SizedBox(height: 3.16.h),
                  CategoryWidget(
                    listHeight: 14.48.h, //remark
                    categoryTitle: appLocalizations.topPicks,
                    modelList: _topPickItems,
                    onReturn: (index) => TopPickitemWidget(
                      topPickItem: _topPickItems[index],
                    ),
                  ),
                  SizedBox(height: 3.16.h),
                  CategoryWidget(
                    listHeight: 10.h,
                    categoryTitle: appLocalizations.forYou,
                    modelList: _forYouItems,
                    onReturn: (index) => ForYouItemWidget(
                      forYouItem: _forYouItems[index],
                    ),
                  ),
                  SizedBox(height: 3.16.h),
                  Padding(
                    padding: context.paddingHorizontal16,
                    child: DottedBox(
                      title: appLocalizations.addYourFavorite,
                      subtitle: appLocalizations.customiseContentMainPage,
                      onPress: () {},
                    ),
                  ),
                  SizedBox(height: 2.8.h),
                ],
              ),
            ),
          ),
        ],
      );
}

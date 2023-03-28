import 'package:bank_of_baku_app/app/constants/app_routes.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/transfer_inside_country/transfer_inside_country_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../widgets/global_appbar.dart';
import '../../main/viewmodels/tab_bar_item_model.dart';
import '../../main/widgets/tab_bar_item_widget.dart';
import '../../main/widgets/tab_bar_widget.dart';
import 'viewmodels/transfer_date_model.dart';
import 'widgets/transaction_date_widget.dart';
import 'widgets/transfer_history_item.dart';

class TransferDateScreen extends StatelessWidget {
  TransferDateScreen({super.key});

  final List<TabBarItemModel> _tabBarItems = [
    TabBarItemModel(text: "Hamisi"),
    TabBarItemModel(text: "Medaxil"),
    TabBarItemModel(text: "Mexaric"),
  ];

  final List<TransferDateModel> _transferDateModel = [
    TransferDateModel(
        icon: AppAssets.arrowedUp,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+12.00 ₼',
        timeStamp: 'Bu gün, 24.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+1.00 ₼',
        timeStamp: 'Bu gün, 24.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '-8.00 ₼',
        timeStamp: 'Bu gün, 24.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+10.00 ₼',
        timeStamp: 'Bu gün, 24.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+12.00 ₼',
        timeStamp: 'Bu gün, 24.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+12.00 ₼',
        timeStamp: 'Dunen, 23.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+12.00 ₼',
        timeStamp: 'Dunen, 23.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+12.00 ₼',
        timeStamp: 'Dunen, 23.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+12.00 ₼',
        timeStamp: 'Dunen, 23.11'),
    TransferDateModel(
        icon: AppAssets.arrowedDown,
        title: 'Karta köçürmə',
        subtitle: 'Kapital Bank, Visa*1792',
        amount: '+12.00 ₼',
        timeStamp: 'Dunen, 23.11'),
  ];

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
            SizedBox(height: 1.31.h),
            _TabBar(tabBarItems: _tabBarItems),
            SizedBox(height: 2.1.h),
            Expanded(
              child: Container(
                decoration:
                    AppBoxDecorations.kMainBackgroundDecoration(context),
                padding: context.paddingHorizontal16Top24,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const TransactionDateWigdet(interval: 5),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _transferDateModel.length,
                          itemBuilder: (context, index) {
                            final TransferDateModel transferDateModel =
                                _transferDateModel[index];
                            final String amount = transferDateModel.amount;
                            final int n = amount.indexOf(".");
                            List chunks = [
                              amount.substring(0, n),
                              amount.substring(n + 1)
                            ];
                            return GestureDetector(
                              onTap: () {
                                AppRoutes.to(context,
                                    const TransferInsideCountryScreen());
                              },
                              child: TransferHistoryItem(
                                index: index,
                                transferDateModel: transferDateModel,
                                chunks: chunks,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TabBar extends StatefulWidget {
  final List<TabBarItemModel> tabBarItems;
  const _TabBar({
    Key? key,
    required this.tabBarItems,
  }) : super(key: key);

  @override
  State<_TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<_TabBar> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      tabBarItems: widget.tabBarItems,
      onReturn: (index) {
        return TabBarItemWidget(
          width: 15.01.h,
          isActive: tabIndex == index,
          tabBarItem: widget.tabBarItems[index],
          onTap: () => setState(() => tabIndex = index),
        );
      },
    );
  }
}

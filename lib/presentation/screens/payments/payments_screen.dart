import 'package:bank_of_baku_app/app/themes/app_colors.dart';
import 'package:bank_of_baku_app/presentation/screens/payments/viewmodels/payments_item_model.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/transfer/widgets/transfer_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main/widgets/category_widget.dart';
import '../main/widgets/tepmlate_item_widget.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  late final List<PaymentsItemmodel> _templateItems;
  late final List<PaymentsItemmodel> _paymentsItems;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();

    _templateItems = [
      PaymentsItemmodel(icon: AppAssets.bakcellLogo, title: 'Bakcell'),
      PaymentsItemmodel(icon: AppAssets.bakcellLogo, title: 'Bakcell'),
      PaymentsItemmodel(
          icon: AppAssets.bakcellLogo, title: 'Bakcell', syncIcon: true),
      PaymentsItemmodel(
          icon: AppAssets.bakcellLogo, title: 'Azercell', syncIcon: true),
      PaymentsItemmodel(icon: AppAssets.bakcellLogo, title: 'Azercell'),
      PaymentsItemmodel(icon: AppAssets.bakcellLogo, title: 'Azercell'),
    ];

    _paymentsItems = [
      PaymentsItemmodel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Mobil rabitə',
      ),
      PaymentsItemmodel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Kommunal xidmətlər',
      ),
      PaymentsItemmodel(
        icon: AppAssets.bonusMenuIcon,
        title: 'İnternet provayderler',
      ),
      PaymentsItemmodel(
        icon: AppAssets.bonusMenuIcon,
        title: 'TV provayderler',
      ),
      PaymentsItemmodel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Stasionar telefonlar',
      ),
      PaymentsItemmodel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Budce odenisleri',
      ),
      PaymentsItemmodel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Budce odenisleri',
      ),
      PaymentsItemmodel(
        icon: AppAssets.bonusMenuIcon,
        title: 'Budce odenisleri',
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
      padding: context.paddingTop24,
      decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
      child: ListView(
        children: [
          CategoryWidget(
            listHeight: 11.5.h,
            titleSize: 17.95.sp,
            categoryTitle: appLocalizations.templates,
            isArrow: true,
            modelList: _templateItems,
            onReturn: (index) => TemplateItemWidget(
              templateItem: _templateItems[index],
              isLastItem: index == _templateItems.length - 1,
            ),
          ),
          SizedBox(height: 3.16.h),
          Padding(
            padding: context.paddingHorizontal16,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Payments',
                      style: AppTextStyles.kCategoryTitleStyle
                          .copyWith(fontSize: 17.95.sp),
                    ),
                  ],
                ),
                SizedBox(height: 1.58.h),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: _paymentsItems.length,
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
                      child: TransferItems(templateItem: _paymentsItems[index]),
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

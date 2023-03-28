import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../../app/themes/app_colors.dart';
import '../../main/widgets/category_widget.dart';
import '../../main/widgets/tepmlate_item_widget.dart';
import 'viewmodels/template_transfer_model.dart';
import 'widgets/transfer_item_widget.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  late final List<TemplateTransferModel> _templateItems;
  late final List<TemplateTransferModel> _transferItems;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();

    _templateItems = [
      TemplateTransferModel(icon: AppAssets.creditCardBlank, title: 'Aysel'),
      TemplateTransferModel(icon: AppAssets.creditCardBlank, title: 'Aysel'),
      TemplateTransferModel(icon: AppAssets.creditCardBlank, title: 'Aysel'),
      TemplateTransferModel(icon: AppAssets.creditCardBlank, title: 'Aysel'),
      TemplateTransferModel(icon: AppAssets.creditCardBlank, title: 'Aysel'),
    ];

    _transferItems = [
      TemplateTransferModel(
          icon: AppAssets.moneyTransferIcon, title: 'Hesablararasi'),
      TemplateTransferModel(
          icon: AppAssets.moneyTransferIcon, title: 'Hesablararasi'),
      TemplateTransferModel(
          icon: AppAssets.moneyTransferIcon, title: 'Hesablararasi'),
      TemplateTransferModel(
          icon: AppAssets.moneyTransferIcon, title: 'Hesablararasi'),
      TemplateTransferModel(
          icon: AppAssets.moneyTransferIcon, title: 'Hesablararasi'),
      TemplateTransferModel(
          icon: AppAssets.moneyTransferIcon, title: 'Hesablararasi'),
      TemplateTransferModel(
          icon: AppAssets.moneyTransferIcon, title: 'Hesablararasi'),
      TemplateTransferModel(
          icon: AppAssets.moneyTransferIcon, title: 'Hesablararasi'),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      appLocalizations.transfer,
                      style: AppTextStyles.kCategoryTitleStyle
                          .copyWith(fontSize: 17.95.sp),
                    ),
                    Text(
                      appLocalizations.history,
                      style: AppTextStyles.kHistoryTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 1.58.h),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: _transferItems.length,
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
                      child: TransferItems(templateItem: _transferItems[index]),
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

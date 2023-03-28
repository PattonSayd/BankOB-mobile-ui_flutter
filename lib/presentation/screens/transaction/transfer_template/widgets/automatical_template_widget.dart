// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/constants/app_assets.dart';
import '../../../../../app/styles/app_box_decorations.dart';
import '../../../../../app/styles/app_strut_styles.dart';
import '../../../../../app/themes/app_colors.dart';
import '../viewmodels/avtomatical_transfer_model.dart';

class AvtomaticalTemplateWidget extends StatelessWidget {
  AvtomaticalTemplateWidget({
    Key? key,
  }) : super(key: key);

  final List<AvtomaticalTransferModel> _avtomaticalTransferModel = [
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her ay'),
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her ay'),
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her gun'),
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her ay'),
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her ay'),
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her gun'),
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her ay'),
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her ay'),
    AvtomaticalTransferModel(
        icon: AppAssets.avtoTransfer,
        title: 'Aysel',
        subtitle: 'AZ23ACAB01350112356332',
        amount: '10.00 ₼',
        date: 'her ay'),
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

  TextStyle get kTemplateAmountStyle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF000000),
        letterSpacing: -0.31,
      );

  TextStyle get kTemplateSubAmountStyle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF797E80),
      );

  TextStyle get kTemplateLowerTextStyle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF2D3940),
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
    return Container(
      decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
      padding: context.paddingHorizontal16Top24,
      child: ListView(
        children: [
          const SizedBox(height: 8),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _avtomaticalTransferModel.length,
            itemBuilder: (context, index) {
              final String amount = _avtomaticalTransferModel[index].amount;
              final int n = amount.indexOf(".");
              List chunks = [amount.substring(0, n), amount.substring(n)];
              return Slidable(
                key: ValueKey(index),
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  extentRatio: 0.3,
                  // dismissible: DismissiblePane(onDismissed: () {}),
                  children: [
                    _buildActionButtons(
                      AppAssets.write,
                      true,
                      () {},
                    ),
                    _buildActionButtons(
                      AppAssets.trash,
                      false,
                      () {},
                    ),
                  ],
                ),
                child: ListTile(
                    leading: _buildLeading(context, index),
                    title: _buildTitle(index),
                    subtitle: _buildSubtitle(index),
                    horizontalTitleGap: 16,
                    contentPadding: EdgeInsets.zero,
                    trailing: _buildTrailing(index, chunks)),
              );
            },
            separatorBuilder: (context, index) => const DividerTheme(
              data: DividerThemeData(space: 0),
              child: Divider(
                thickness: 0.5,
                color: Color(0xFFF0F2F2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildActionButtons(String icon, bool isLeft, Function onTap) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap(),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.instance.slideToActBackgroundColor,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(isLeft ? 12 : 0),
                // right: Radius.circular(isLeft ? 0 : 12),
              ),
            ),
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      );

  Padding _buildTitle(int index) => Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Text(
          _avtomaticalTransferModel[index].title,
          style: kTemplateTitleStyle,
          strutStyle: AppStrutStyles.kBodyS,
        ),
      );

  GestureDetector _buildSubtitle(int index) => GestureDetector(
        child: Text(
          _avtomaticalTransferModel[index].subtitle,
          style: kTemplateSubtitleStyle,
          strutStyle: AppStrutStyles.kCaption,
        ),
      );

  Container _buildLeading(BuildContext context, int index) => Container(
        height: 5.26.h,
        width: 10.18.w,
        decoration: kItemDecoration(context),
        child: SvgPicture.asset(
          _avtomaticalTransferModel[index].icon,
          fit: BoxFit.scaleDown,
        ),
      );

  Padding _buildTrailing(int index, List chunks) => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: chunks[0], style: kTemplateAmountStyle),
                  TextSpan(
                    text: chunks[1],
                    style: kTemplateSubAmountStyle,
                  ),
                  // TextSpan(text: splitByLength())
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(_avtomaticalTransferModel[index].date)
          ],
        ),
      );
}

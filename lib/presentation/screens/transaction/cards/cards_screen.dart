import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../widgets/global_appbar.dart';
import '../../../widgets/global_button.dart';

import 'viewmodels/card_items_model.dart';

class CardsScreen extends StatelessWidget {
  CardsScreen({super.key});

  final List<CardItemsModel> _cardItemsModel = [
    CardItemsModel(
      bgImage: AppAssets.miniCard,
      title: 'Visa Infinite',
      subtitle: 'Debet',
      amount: '5 000.00 ₼',
      code: '*2814',
    ),
    CardItemsModel(
      bgImage: AppAssets.miniCardLiteBlue,
      title: 'Mastercard Gold',
      subtitle: 'Kredit odənişi 5 gün sonra',
      amount: '5 000.00 ₼',
      subAmount: '750.00 ₼',
      code: '*2814',
    ),
    CardItemsModel(
      bgImage: AppAssets.miniCardBlue,
      title: 'Mastercard Standard',
      subtitle: 'Debet',
      amount: '330.80 ₼',
      code: '*2814',
    ),
  ];

  TextStyle get kCardsTitleStyle => TextStyle(
        color: AppColors.instance.textBlackColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.15,
      );

  TextStyle get kCardsSubtitleStyle => const TextStyle(
        color: Color(0xff797E80),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get kCardsUpperAmountStyle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF000000),
        letterSpacing: -0.31,
      );

  TextStyle get kCardsUpperSubAmountStyle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF797E80),
      );

  TextStyle get kCardsLowerAmountStyle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFF000000),
      );

  TextStyle get kCardsLowerSubAmountStyle => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xFF797E80),
      );

  TextStyle get kCardsCodeStyle => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xFFFFFFFF),
      );

  BoxDecoration kItemDecoration(BuildContext context) => BoxDecoration(
      color: AppColors.instance.bonusBoxColor,
      borderRadius: context.borderRadiusAll8,
      border: Border.all(
        width: 1,
        style: BorderStyle.solid,
        color: AppColors.instance.bonusBoxBorderColor,
      ));

  checkAmout(int index, List collection) {
    List chunks = [];
    for (var n in collection) {
      if (n == null) continue;
      final int pos = n.indexOf(".");
      chunks.add([n.substring(0, pos), n.substring(pos)]);
    }
    return chunks;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: const GlobalAppBar(
          titleText: 'Kartlar',
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration:
                    AppBoxDecorations.kMainBackgroundDecoration(context),
                padding: context.paddingHorizontal16Top24,
                child: ListView(
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _cardItemsModel.length,
                      itemBuilder: (context, index) {
                        List collection = [];
                        collection.add(_cardItemsModel[index].amount);
                        collection.add(_cardItemsModel[index].subAmount);
                        final chunks = checkAmout(index, collection);
                        return ListTile(
                            leading: _buildLeading(context, index),
                            title: _buildTitle(index),
                            subtitle: _buildSubtitle(index),
                            horizontalTitleGap: 16,
                            contentPadding: EdgeInsets.zero,
                            trailing: _buildTrailing(chunks, index));
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
              ),
            ),
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 20),
                child: GlobalButton(buttonText: "New card", buttonTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildLeading(BuildContext context, int index) => Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 5.26.h,
            width: 10.18.w,
            decoration: kItemDecoration(context),
            child: ClipRRect(
              borderRadius: context.borderRadiusAll8,
              child: Image.asset(
                _cardItemsModel[index].bgImage,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, bottom: 4),
            child: Text(
              _cardItemsModel[index].code,
              style: kCardsCodeStyle,
              strutStyle: AppStrutStyles.kDefault,
            ),
          ),
        ],
      );

  Padding _buildTitle(int index) => Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Text(
          _cardItemsModel[index].title,
          style: kCardsTitleStyle,
          strutStyle: AppStrutStyles.kBodyS,
        ),
      );

  GestureDetector _buildSubtitle(int index) => GestureDetector(
        child: Text(
          _cardItemsModel[index].subtitle,
          style: kCardsSubtitleStyle,
          strutStyle: AppStrutStyles.kCaption,
        ),
      );

  Column _buildTrailing(List chunks, int index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: chunks[0][0], style: kCardsUpperAmountStyle),
                TextSpan(
                  text: chunks[0][1],
                  style: kCardsUpperSubAmountStyle,
                ),
              ],
            ),
          ),
          if (_cardItemsModel[index].subAmount != null) ...[
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: chunks[1][0], style: kCardsLowerAmountStyle),
                  TextSpan(
                    text: chunks[1][1],
                    style: kCardsLowerSubAmountStyle,
                  ),
                ],
              ),
            ),
          ]
        ],
      );
}

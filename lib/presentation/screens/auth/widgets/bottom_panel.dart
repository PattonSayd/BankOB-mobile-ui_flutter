import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/constants/app_routes.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../widgets/global_button.dart';
import '../../../widgets/global_header_text.dart';
import '../../register/register_screen.dart';
import '../viewmodels/options_item_model.dart';
import 'options_widget.dart';

class BottomPanel extends StatefulWidget {
  final AppLocalizations appLocalizations;

  const BottomPanel({
    Key? key,
    required this.appLocalizations,
  }) : super(key: key);

  @override
  State<BottomPanel> createState() => _BottomPanelState();
}

class _BottomPanelState extends State<BottomPanel> {
  late final List<OptionsItemModel> _optionsList;

  @override
  void initState() {
    super.initState();
    _optionsList = [
      OptionsItemModel(
        itemText: widget.appLocalizations.loanOrder,
        itemIcon: AppAssets.loanOrder,
        itemTap: () {},
      ),
      OptionsItemModel(
        itemText: widget.appLocalizations.cardOrder,
        itemIcon: AppAssets.cardOrder,
        itemTap: () {},
      ),
      OptionsItemModel(
        itemText: widget.appLocalizations.currency,
        itemIcon: AppAssets.currency,
        itemTap: () {},
      ),
      OptionsItemModel(
        itemText: widget.appLocalizations.faq,
        itemIcon: AppAssets.faq,
        itemTap: () {},
      ),
      OptionsItemModel(
        itemText: widget.appLocalizations.loanOrder,
        itemIcon: AppAssets.loanOrder,
        itemTap: () {},
      ),
      OptionsItemModel(
        itemText: widget.appLocalizations.cardOrder,
        itemIcon: AppAssets.cardOrder,
        itemTap: () {},
      ),
      OptionsItemModel(
        itemText: widget.appLocalizations.currency,
        itemIcon: AppAssets.currency,
        itemTap: () {},
      ),
      OptionsItemModel(
        itemText: widget.appLocalizations.faq,
        itemIcon: AppAssets.faq,
        itemTap: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.62,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.only(top: 3.16.h, left: 2.1.h, right: 2.1.h),
          //for gradient background
          decoration: AppBoxDecorations.kBottomPanelDecoration(context),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 1.58.h),
              GlobalHeaderText(
                  headerText: widget.appLocalizations.startYourJourney),
              SizedBox(height: 5.26.h),
              _buildButtons,
              SizedBox(height: 2.63.h),
              _buildTexts,
              SizedBox(height: 3.68.h),
              OptionsWidget(optionsList: _optionsList),
            ],
          ),
        );
      },
    );
  }

  Widget get _buildButtons => Column(
        children: [
          GlobalButton(
            buttonText: widget.appLocalizations.continueAsMeggy,
            buttonTap: () {},
          ),
          SizedBox(height: 2.1.h),
          GlobalButton(
            buttonText: widget.appLocalizations.addNewUser,
            showBorder: true,
            buttonTap: () {
              AppRoutes.to(context, const RegisterScreen());
            },
          ),
        ],
      );

  Widget get _buildTexts => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.appLocalizations.nearestBranch,
              style: AppTextStyles.kForgotPasswordTextStyle),
          Text(widget.appLocalizations.contactUs,
              style: AppTextStyles.kForgotPasswordTextStyle),
        ],
      );
}

import 'package:bank_of_baku_app/app/global/global_bottom_sheet.dart';
import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/card_menu/main_menu/viewmodels/card_menu_item_model.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/card_menu/main_menu/widgets/card_menu_item_widget.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/card_menu/requisites/requisites_menu_screen.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_text_fileds.dart';
import 'package:flutter/material.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/constants/app_assets.dart';
import '../../../../../app/constants/app_routes.dart';
import '../../../../../app/styles/app_box_decorations.dart';
import '../../../../../app/styles/app_text_styles.dart';
import '../../../../widgets/global_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../widgets/global_button.dart';
import '../../../lock/widgets/mini_header_text_widget.dart';
import '../conditions/conditions_menu_screen.dart';

class CardMenuScreen extends StatefulWidget {
  const CardMenuScreen({super.key});

  @override
  State<CardMenuScreen> createState() => _CardMenuScreenState();
}

class _CardMenuScreenState extends State<CardMenuScreen> {
  late final List<CardMenuItemModel> _cardMenuItems;
  late AppLocalizations appLocalizations;
  late final TextEditingController renameController;
  late final FocusNode renameFocus;

  @override
  void initState() {
    super.initState();

    _cardMenuItems = [
      CardMenuItemModel(icon: AppAssets.conditions, title: 'Şərtlər'),
      CardMenuItemModel(icon: AppAssets.props, title: 'Rekvizitlər'),
      CardMenuItemModel(icon: AppAssets.edit, title: 'Ad dəyişikliyi'),
    ];

    renameController = TextEditingController(text: 'Avtomobil');
    renameFocus = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    renameController.dispose();
    renameFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        appBar: const GlobalAppBar(titleText: 'Menu'),
        body: Container(
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          padding: context.paddingHorizontal16,
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _cardMenuItems.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: CardMenuItemWidget(
                        cardMenuItems: _cardMenuItems[index]),
                    onTap: () {
                      if (index == 0) {
                        AppRoutes.to(context, const ConditionsMenuScreen());
                      }
                      if (index == 1) {
                        AppRoutes.to(context, const RequisitesMenuScreen());
                      }
                      if (index == 2) {
                        GlobalBottomSheet.showGlobalModal(context,
                            child: _buildRename);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildRename => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MiniHeaderTextWidget(miniHeaderText: 'Ad dəyişikliyi'),
          SizedBox(height: 2.63.h),
          Text(
            'Kredit üçün yeni adı təyin et',
            style: AppTextStyles.kAreYouSureLogoutTextStyle(),
            strutStyle: AppStrutStyles.kBodyS,
          ),
          SizedBox(height: 2.63.h),
          GlobalTextField(
            inputController: renameController,
            inputFocus: renameFocus,
            labelText: 'Kreditin adi',
          ),
          SizedBox(height: 3.16.h),
          GlobalButton(
            buttonText: 'Təsdiq et',
            buttonTap: () {},
          ),
          SizedBox(height: 2.1.h),
        ],
      );
}

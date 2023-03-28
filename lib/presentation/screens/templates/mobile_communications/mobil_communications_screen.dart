import 'package:bank_of_baku_app/presentation/screens/templates/mobile_communications/viewmodels/mobil_communications_item_model.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/receipt/receipt_screen.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_row_tile.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_search.dart';
import 'package:flutter/material.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../app/constants/app_assets.dart';
import '../../../../../app/constants/app_routes.dart';
import '../../../../../app/styles/app_box_decorations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/global_appbar.dart';

class MobilCommunicationsScreen extends StatefulWidget {
  const MobilCommunicationsScreen({super.key});

  @override
  State<MobilCommunicationsScreen> createState() =>
      _MobilCommunicationsScreenState();
}

class _MobilCommunicationsScreenState extends State<MobilCommunicationsScreen> {
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  late final List<MobilCommunicationsItemModel> _mobilCommunicationsItems;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();

    _mobilCommunicationsItems = [
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
      MobilCommunicationsItemModel(
          icon: AppAssets.bakcellRange, title: 'Bakcell'),
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
    _searchController.dispose();
    _searchFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: AppBoxDecorations.kScaffoldDecoration(context),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode searchFocusNode = FocusScope.of(context);
            if (!searchFocusNode.hasPrimaryFocus) {
              searchFocusNode.unfocus();
            }
          },
          child: Scaffold(
            appBar: const GlobalAppBar(titleText: 'Mobil rabite'),
            body: Container(
              decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
              padding: context.paddingHorizontal16Top24,
              height: context.deviceHeight,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GlobalSearch(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        appLocalizations: appLocalizations),
                    SizedBox(height: 0.52.h),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _mobilCommunicationsItems.length,
                      separatorBuilder: (context, index) => const DividerTheme(
                        data: DividerThemeData(space: 0),
                        child: Divider(
                          color: Color(0xFFF0F2F2),
                          thickness: 0.5,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: GlobalRowTile(
                            rowTileItem: _mobilCommunicationsItems[index],
                          ),
                          onTap: () {
                            AppRoutes.to(context, const ReceiptScreen());
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

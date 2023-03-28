import 'package:bank_of_baku_app/presentation/screens/transaction/landlines/viewmodels/landlines_item_model.dart';
import 'package:bank_of_baku_app/presentation/screens/transaction/receipt/receipt_screen.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_row_tile.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_search.dart';
import 'package:flutter/material.dart';
import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/constants/app_routes.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../widgets/global_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandlinesScreen extends StatefulWidget {
  const LandlinesScreen({super.key});

  @override
  State<LandlinesScreen> createState() => _LandlinesScreenState();
}

class _LandlinesScreenState extends State<LandlinesScreen> {
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  late final List<LandlinesItemModel> _landlinesItems;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();

    _landlinesItems = [
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
      LandlinesItemModel(icon: AppAssets.katv1, title: 'Katv 1'),
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
            appBar: GlobalAppBar(titleText: appLocalizations.stationaryPhones),
            body: Container(
              decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
              padding: context.paddingHorizontal16Top24,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GlobalSearch(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      appLocalizations: appLocalizations,
                    ),
                    SizedBox(height: 0.52.h),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _landlinesItems.length,
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
                              imageFormat: ImageFormat.png,
                              rowTileItem: _landlinesItems[index]),
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

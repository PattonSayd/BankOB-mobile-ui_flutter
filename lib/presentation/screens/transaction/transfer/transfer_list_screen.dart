import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/styles/app_box_decorations.dart';
import '../../../../app/styles/app_text_styles.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../widgets/global_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransferListScreen extends StatefulWidget {
  const TransferListScreen({super.key});

  @override
  State<TransferListScreen> createState() => _TransferListScreenState();
}

class _TransferListScreenState extends State<TransferListScreen> {
  late AppLocalizations appLocalizations;

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
        appBar: GlobalAppBar(titleText: appLocalizations.transferList),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: AppBoxDecorations.kMainBackgroundDecoration(context),
          child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) {
              return Padding(
                padding: context.paddingHorizontal16,
                child: const DividerTheme(
                  data: DividerThemeData(space: 0),
                  child: Divider(
                    color: Color(0xFFF0F2F2),
                    thickness: 0.5,
                  ),
                ),
              );
            },
            itemBuilder: (context, index) {
              return Slidable(
                key: ValueKey(index),
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  extentRatio: 0.3,
                  // dismissible: DismissiblePane(onDismissed: () {}),
                  children: [
                    _buildActionButtons(
                      AppAssets.check,
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
                child: Container(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 0 : 12,
                    bottom: 12,
                  ),
                  child: Padding(
                    padding: context.paddingHorizontal16,
                    child: Row(
                      children: [
                        _buildLeadingText,
                        const Spacer(),
                        _buildTrailingText,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(String icon, bool isLeft, Function onTap) =>
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(icon),
            ),
          ),
        ),
      );

  Widget get _buildLeadingText => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Azer Suleymanov Etibar',
            style: AppTextStyles.kTransferListTitleStyle,
            strutStyle: AppStrutStyles.kBodyS,
          ),
          SizedBox(height: 0.26.h),
          Text(
            'AZ23ACAB01350112356332',
            style: AppTextStyles.kTransferListSubitleStyle,
            strutStyle: AppStrutStyles.kCaption,
          ),
          SizedBox(height: 0.26.h),
          Text(
            '17.08.2022',
            style: AppTextStyles.kTransferListDateTextStyle,
            strutStyle: AppStrutStyles.kCaption,
          ),
        ],
      );

  Widget get _buildTrailingText => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              text: '10',
              style: AppTextStyles.kTransferListTitleStyle,
              children: <TextSpan>[
                TextSpan(
                  text: '.00 ₼',
                  style: AppTextStyles.kTransferListSalaryTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: 0.52.h),
          Text(
            appLocalizations.completed,
            style: AppTextStyles.kTransferListCompletedTextStyle,
            strutStyle: AppStrutStyles.kCaption,
          ),
        ],
      );
}

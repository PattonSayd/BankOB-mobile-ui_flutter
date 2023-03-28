import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/extensions/context_extension.dart';
import '../../../../app/styles/app_gradient.dart';
import '../../../../app/styles/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCardItemWidget extends StatefulWidget {
  const AddCardItemWidget({Key? key}) : super(key: key);

  @override
  State<AddCardItemWidget> createState() => _AddCardItemWidgetState();
}

class _AddCardItemWidgetState extends State<AddCardItemWidget> {
  late AppLocalizations appLocalizations;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: context.paddingSymmetric(36, 0),
        width: context.deviceWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.cardGlass),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: context.paddingSymmetric(20, 21),
              child: Text(
                appLocalizations.cardDetails,
                style: AppTextStyles.kAddCardDetailsTextStyle,
              ),
            ),
            const SizedBox(height: 9),
            _buildCardNumber,
            const SizedBox(height: 20),
            _buildDateAndCvv,
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget get _buildCardNumber => ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration:
                BoxDecoration(gradient: AppGradient.addCardLineGradient),
            child: Padding(
              padding: context.paddingSymmetric(20, 0),
              child: Text(
                '1234 •••• •••• ••••',
                style: AppTextStyles.kAddCardCodeObsecureTextStyle,
              ),
            ),
          ),
        ),
      );

  Widget get _buildDateAndCvv => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              'ˍˍ/22',
              style: AppTextStyles.kAddCardDateTextStyle,
            ),
            const SizedBox(width: 16),
            Container(
              padding: context.paddingSymmetric(5.5, 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  gradient: AppGradient.addCardLineGradient),
              child: Text(
                '••3',
                style: AppTextStyles.kCvvTextStyle,
              ),
            ),
          ],
        ),
      );
}

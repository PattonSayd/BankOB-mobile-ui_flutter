import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/constants/app_assets.dart';
import '../../../app/extensions/context_extension.dart';
import '../../../app/styles/app_box_decorations.dart';
import '../../../app/styles/app_text_styles.dart';
import '../../widgets/global_appbar.dart';
import '../../widgets/global_empty_size.dart';
import 'widgets/pin_code_widget.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
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
        appBar: const GlobalAppBar(showTitleText: false),
        body: Center(
          child: Column(
            children: [
              const GlobalEmptySize(),
              SvgPicture.asset(AppAssets.profile),
              SizedBox(height: 2.h),
              _buildEnterPinText,
              SizedBox(height: 9.61.h), //remark
              const PinCodeWidget(maxDotLength: 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildEnterPinText => Padding(
        padding: context.paddingHorizontal24,
        child: Text(
          appLocalizations.enterPin, //appLocalizations.tryRepeatSomePinCode
          textAlign: TextAlign.center,
          style: AppTextStyles.kEnterPinTextStyle,
        ),
      );
}

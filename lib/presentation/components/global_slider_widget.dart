import 'package:bank_of_baku_app/app/styles/app_box_decorations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import '../../../app/extensions/context_extension.dart';
import '../widgets/global_empty_size.dart';
import '../widgets/global_slider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidget();
}

class _SliderWidget extends State<SliderWidget> {
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
        body: Padding(
          padding: context.paddingHorizontal16,
          child: Column(
            children: [
              SizedBox(height: 5.h),
              _buildSlider,
              const GlobalEmptySize(),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildSlider => Column(
        children: [
          GlobalSlider(
            labeltext: appLocalizations.salary,
            currency: '₼',
            minAmount: 0,
            maxAmount: 30000,
          ),
          SizedBox(height: 2.2.h),
        ],
      );
}

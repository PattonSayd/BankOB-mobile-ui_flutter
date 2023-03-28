import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/extensions/context_extension.dart';
import '../../app/styles/app_box_decorations.dart';
import '../widgets/global_dropdown_button.dart';
import '../widgets/global_empty_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  State<DropDownScreen> createState() => _DropDownScreen();
}

class _DropDownScreen extends State<DropDownScreen> {
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
              _buildDropDown,
              const GlobalEmptySize(),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildDropDown => Column(
        children: [
          GlobalDropDownButton(
            labelText: appLocalizations.region,
            dropdownItems: const ['Baki, Absheron(12)'],
          ),
          const SizedBox(height: 8),
          const GlobalDropDownButton(
              isDeactive: true,
              hintText: 'Baki, Absheron(12)',
              dropdownItems: []),
          const SizedBox(height: 8),
          const GlobalDropDownButton(
              isEnabled: false,
              hintText: 'Baki, Absheron(12)',
              dropdownItems: []),
          const SizedBox(height: 8),
        ],
      );
}

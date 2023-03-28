import 'package:bank_of_baku_app/app/styles/app_box_decorations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import '../../../app/extensions/context_extension.dart';
import '../widgets/global_empty_size.dart';
import '../widgets/global_text_fileds.dart';

class TextFieldsWidget extends StatefulWidget {
  const TextFieldsWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldsWidget> createState() => _TextFieldsWidget();
}

class _TextFieldsWidget extends State<TextFieldsWidget> {
  late AppLocalizations appLocalizations;
  late final TextEditingController clientCodeController1;
  late final FocusNode clientCodeFocus1;
  late final TextEditingController clientCodeController2;
  late final FocusNode clientCodeFocus2;
  late final TextEditingController clientCodeController3;
  late final FocusNode clientCodeFocus3;
  late final TextEditingController clientCodeController4;
  late final FocusNode clientCodeFocus4;
  late final TextEditingController clientCodeController5;
  late final FocusNode clientCodeFocus5;
  late final TextEditingController clientCodeController6;
  late final FocusNode clientCodeFocus6;
  late final TextEditingController clientCodeController7;
  late final FocusNode clientCodeFocus7;
  late final TextEditingController clientCodeController8;
  late final FocusNode clientCodeFocus8;

  @override
  void initState() {
    super.initState();
    clientCodeController1 = TextEditingController();
    clientCodeFocus1 = FocusNode();
    clientCodeController2 = TextEditingController(text: '7777');
    clientCodeFocus2 = FocusNode();
    clientCodeController3 = TextEditingController(text: '7777 _ _');
    clientCodeFocus3 = FocusNode();
    clientCodeController4 = TextEditingController(text: '7777');
    clientCodeFocus4 = FocusNode();
    clientCodeController5 = TextEditingController(text: '7777');
    clientCodeFocus6 = FocusNode();
    clientCodeController6 = TextEditingController(text: '7777 _ _');
    clientCodeFocus5 = FocusNode();
    clientCodeController7 = TextEditingController(text: '7777');
    clientCodeFocus7 = FocusNode();
    clientCodeController8 = TextEditingController(text: '7777');
    clientCodeFocus8 = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    clientCodeController1.dispose();
    clientCodeFocus1.dispose();
    clientCodeController2.dispose();
    clientCodeFocus2.dispose();
    clientCodeController3.dispose();
    clientCodeFocus3.dispose();
    clientCodeController4.dispose();
    clientCodeFocus4.dispose();
    clientCodeController5.dispose();
    clientCodeFocus5.dispose();
    clientCodeController6.dispose();
    clientCodeFocus6.dispose();
    clientCodeController7.dispose();
    clientCodeFocus7.dispose();
    clientCodeController8.dispose();
    clientCodeFocus8.dispose();
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
              _buildInputs,
              const GlobalEmptySize(),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildInputs => Column(
        children: [
          GlobalTextField(
            inputController: clientCodeController1,
            inputFocus: clientCodeFocus1,
            isDefault: true,
            isHint: '7777',
          ),
          SizedBox(height: 2.2.h),
          GlobalTextField(
            labelText: appLocalizations.clientsCodeOrPin,
            inputController: clientCodeController2,
            inputFocus: clientCodeFocus2,
          ),
          SizedBox(height: 2.2.h),
          GlobalTextField(
            labelText: appLocalizations.clientsCodeOrPin,
            inputController: clientCodeController3,
            inputFocus: clientCodeFocus3,
          ),
          SizedBox(height: 2.2.h),
          GlobalTextField(
            labelText: appLocalizations.clientsCodeOrPin,
            inputController: clientCodeController4,
            inputFocus: clientCodeFocus4,
            isEnabled: false,
          ),
          SizedBox(height: 2.2.h),
          GlobalTextField(
            inputController: clientCodeController5,
            inputFocus: clientCodeFocus5,
            isEnabled: false,
          ),
          SizedBox(height: 2.2.h),
          GlobalTextField(
            labelText: appLocalizations.clientsCodeOrPin,
            inputController: clientCodeController6,
            inputFocus: clientCodeFocus6,
            isDefault: true,
            progressSuffixIcon: true,
          ),
          SizedBox(height: 2.2.h),
          GlobalTextField(
            labelText: appLocalizations.clientsCodeOrPin,
            inputController: clientCodeController7,
            inputFocus: clientCodeFocus7,
            isDefault: true,
            successSuffixIcon: true,
          ),
          SizedBox(height: 2.2.h),
          GlobalTextField(
            labelText: appLocalizations.clientsCodeOrPin,
            inputController: clientCodeController8,
            inputFocus: clientCodeFocus8,
            isValidate: true,
          ),
          SizedBox(height: 2.2.h),
        ],
      );
}

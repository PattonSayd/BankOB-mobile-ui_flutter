import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import '../../../widgets/global_text_fileds.dart';

class AddCardTextFieldWidget extends StatefulWidget {
  const AddCardTextFieldWidget({super.key});

  @override
  State<AddCardTextFieldWidget> createState() => _AddCardTextFieldWidgetState();
}

class _AddCardTextFieldWidgetState extends State<AddCardTextFieldWidget> {
  late AppLocalizations appLocalizations;
  late final TextEditingController numberController;
  late final FocusNode numberFocus;
  late final TextEditingController dataController;
  late final FocusNode dataFocus;
  late final TextEditingController codeController;
  late final FocusNode codeFocus;

  @override
  void initState() {
    super.initState();
    numberController = TextEditingController();
    numberFocus = FocusNode();
    dataController = TextEditingController();
    dataFocus = FocusNode();
    codeController = TextEditingController();
    codeFocus = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    numberController.dispose();
    numberFocus.dispose();
    dataController.dispose();
    dataFocus.dispose();
    codeController.dispose();
    codeFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontal16,
      child: Column(
        children: [
          _buildInputs,
        ],
      ),
    );
  }

  Widget get _buildInputs => Column(
        children: [
          GlobalTextField(
            labelText: appLocalizations.cardNumber,
            inputController: numberController,
            inputFocus: numberFocus,
          ),
          SizedBox(height: 2.6.h),
          GlobalTextField(
            labelText: appLocalizations.expirationDate,
            inputController: dataController,
            inputFocus: dataFocus,
          ),
          SizedBox(height: 2.6.h),
          GlobalTextField(
            labelText: 'CVV2/CVC2',
            inputController: codeController,
            inputFocus: codeFocus,
          ),
          SizedBox(height: 2.6.h),
        ],
      );
}

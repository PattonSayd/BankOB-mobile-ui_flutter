import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:bank_of_baku_app/app/styles/app_box_decorations.dart';
import 'package:bank_of_baku_app/presentation/widgets/global_header_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/constants/app_routes.dart';
import '../../widgets/global_button.dart';
import '../../widgets/global_input.dart';
import '../otp/otp_screen.dart';

class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({super.key});

  @override
  State<ForgotPinScreen> createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState extends State<ForgotPinScreen> {
  late AppLocalizations appLocalizations;
  late final TextEditingController clientCodeController;
  late final FocusNode clientCodeFocus;

  @override
  void initState() {
    super.initState();
    clientCodeController = TextEditingController();
    clientCodeFocus = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    clientCodeController.dispose();
    clientCodeFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: context.paddingHorizontal16,
              child: Column(
                children: [
                  // const GlobalEmptySize(),
                  GlobalHeaderText(headerText: appLocalizations.forgotPin),
                  SizedBox(height: 4.h),
                  GlobalInput(
                    labelText: appLocalizations.clientsCodeOrPin,
                    inputController: clientCodeController,
                    inputFocus: clientCodeFocus,
                  ),
                  SizedBox(height: 4.4.h),
                  GlobalButton(
                    buttonText: appLocalizations.continueButton,
                    buttonTap: () {
                      AppRoutes.to(context, const OtpScreen());
                    },
                  ),
                  // const GlobalEmptySize(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

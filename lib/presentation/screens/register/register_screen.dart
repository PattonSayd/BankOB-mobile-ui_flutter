import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/constants/app_routes.dart';
import '../../../app/extensions/context_extension.dart';
import '../../../app/styles/app_box_decorations.dart';
import '../../../app/styles/app_text_styles.dart';
import '../../widgets/global_button.dart';
import '../../widgets/global_header_text.dart';
import '../../widgets/global_input.dart';
import '../otp/otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late AppLocalizations appLocalizations;
  late final TextEditingController clientCodeController;
  late final TextEditingController passwordController;
  late final FocusNode clientCodeFocus;
  late final FocusNode passwordFocus;

  @override
  void initState() {
    super.initState();
    clientCodeController = TextEditingController();
    passwordController = TextEditingController();
    clientCodeFocus = FocusNode();
    passwordFocus = FocusNode();
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
    passwordController.dispose();
    clientCodeFocus.dispose();
    passwordFocus.dispose();
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
                  GlobalHeaderText(headerText: appLocalizations.register),
                  SizedBox(height: 4.40.h),
                  _buildInputs,
                  SizedBox(height: 1.44.h),
                  _buildForgotPasswordText,
                  SizedBox(height: 4.74.h),
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

  Widget get _buildInputs => Column(
        children: [
          GlobalInput(
            labelText: appLocalizations.clientsCodeOrPin,
            inputController: clientCodeController,
            inputFocus: clientCodeFocus,
          ),
          SizedBox(height: 2.63.h),
          GlobalInput(
            labelText: appLocalizations.password,
            inputController: passwordController,
            inputFocus: passwordFocus,
            obscureText: true,
          ),
        ],
      );

  Widget get _buildForgotPasswordText => Align(
        alignment: Alignment.centerLeft,
        child: Text(appLocalizations.forgotPassword,
            style: AppTextStyles.kForgotPasswordTextStyle),
      );
}

import 'package:bank_of_baku_app/app/extensions/context_extension.dart';

import '../../../app/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/styles/app_box_decorations.dart';
import '../../widgets/global_button.dart';
import '../../widgets/global_empty_size.dart';
import '../../widgets/global_header_text.dart';
import '../auth/auth_screen.dart';
import 'widgets/language_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //for scaffold gradient color
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        body: Padding(
          padding: context.paddingHorizontal16,
          child: Column(
            children: [
              const GlobalEmptySize(),
              GlobalHeaderText(
                paddingHorizontal: 1.2.h,
                headerText: appLocalizations.welcomeMessage,
              ),
              SizedBox(height: 7.375.h),
              const LanguagesWidget(),
              const GlobalEmptySize(),
              GlobalButton(
                buttonText: appLocalizations.continueButton,
                buttonTap: () {
                  AppRoutes.to(context, const AuthScreen());
                },
              ),
              SizedBox(height: 2.63.h),
            ],
          ),
        ),
      ),
    );
  }
}

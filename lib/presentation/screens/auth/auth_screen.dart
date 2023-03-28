import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/styles/app_box_decorations.dart';
import 'widgets/bottom_panel.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      decoration: AppBoxDecorations.kImageBackgroundDecoration,
      child: Scaffold(
        body: Align(
          alignment: Alignment.bottomCenter,
          child: BottomPanel(appLocalizations: appLocalizations),
        ),
      ),
    );
  }
}

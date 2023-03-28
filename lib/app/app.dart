import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../presentation/screens/templates/mobile_communications/mobil_communications_screen.dart';
import 'themes/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'), //for test
          title: 'Bank Of Baku',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.appThemes(context: context),
          home: const MobilCommunicationsScreen(),
        );
      },
    );
  }
}

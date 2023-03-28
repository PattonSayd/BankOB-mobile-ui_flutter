import 'package:flutter/material.dart';

import '../../app/extensions/context_extension.dart';
import '../../app/styles/app_text_styles.dart';

class GlobalHeaderText extends StatelessWidget {
  final double paddingHorizontal;
  final String headerText;
  const GlobalHeaderText({
    Key? key,
    this.paddingHorizontal = 0,
    required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingSymmetric(paddingHorizontal, 0),
      child: Text(
        headerText,
        textAlign: TextAlign.center,
        style: AppTextStyles.kRegisterTitleTextStyle,
      ),
    );
  }
}

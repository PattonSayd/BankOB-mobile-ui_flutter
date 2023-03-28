import 'package:bank_of_baku_app/app/styles/app_strut_styles.dart';
import 'package:bank_of_baku_app/app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class MiniHeaderTextWidget extends StatelessWidget {
  final String miniHeaderText;
  const MiniHeaderTextWidget({
    Key? key,
    required this.miniHeaderText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(miniHeaderText,
        style: AppTextStyles.kMiniHeaderTextStyle,
        strutStyle: AppStrutStyles.kTitle);
  }
}

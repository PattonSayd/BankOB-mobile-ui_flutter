import 'package:flutter/material.dart';

import '../../app/styles/app_text_styles.dart';

class GlobalCardAmountText extends StatelessWidget {
  final String amount;
  final String sign;
  const GlobalCardAmountText({
    super.key,
    required this.amount,
    required this.sign,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$amount ',
        style: AppTextStyles.kCardAmountTextStyle,
        children: [
          TextSpan(text: sign, style: AppTextStyles.kMoneySignTextStyle),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/constants/app_assets.dart';
import '../../../../app/styles/app_text_styles.dart';

class PinCodeItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  const PinCodeItemWidget({
    Key? key,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.transparent),
        shape: const CircleBorder(),
      ),
      onPressed: onTap,
      child: _pinCodeItems(index),
    );
  }

  Widget _pinCodeItems(int index) {
    if (index == 9) {
      return SvgPicture.asset(AppAssets.fingerprint);
    } else if (index == 11) {
      return SvgPicture.asset(AppAssets.delete);
    }
    String number = (index + 1).toString();
    return Text(index == 10 ? '0' : number,
        textAlign: TextAlign.center,
        style: AppTextStyles.kPinCodeNumberTextStyle);
  }
}

import 'package:bank_of_baku_app/app/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';

class GlobalSwitch extends StatefulWidget {
  const GlobalSwitch({super.key});

  @override
  State<GlobalSwitch> createState() => _GlobalSwitchState();
}

class _GlobalSwitchState extends State<GlobalSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
      child: CupertinoSwitch(
        activeColor: AppColors.instance.primaryColor,
        thumbColor: AppColors.instance.cardColor,
        trackColor: AppColors.instance.borderInactiveColor,
        onChanged: (value) {
          isSwitched = value;
          setState(() {});
        },
        value: isSwitched,
      ),
    );
  }
}

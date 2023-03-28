import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/extensions/context_extension.dart';
import '../../app/themes/app_colors.dart';

class GlobalBottomSheetDragLine extends StatelessWidget {
  const GlobalBottomSheetDragLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 0.52.h,
        width: 11.20.w, //remark
        decoration: BoxDecoration(
          color: AppColors.instance.bottomSheetDragLineColor,
          borderRadius: context.borderRadiusAll8,
        ),
      ),
    );
  }
}

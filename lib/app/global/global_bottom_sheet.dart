import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../presentation/widgets/global_bottom_sheet_drag_line.dart';
import '../themes/app_colors.dart';

class GlobalBottomSheet {
  static void showGlobalModal(BuildContext context, {required Widget child}) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.instance.cardColor,
      shape: context.roundedRectangleBorderTop28, //remark
      builder: (BuildContext context) {
        return Padding(
          padding: context.paddingHorizontal16, //remark
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 1.58.h), //remark
              const GlobalBottomSheetDragLine(),
              SizedBox(height: 2.63.h),
              child,
            ],
          ),
        );
      },
    );
  }
}

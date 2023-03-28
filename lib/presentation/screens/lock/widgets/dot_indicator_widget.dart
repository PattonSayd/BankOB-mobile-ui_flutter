import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/styles/app_box_decorations.dart';

class DotIndicatorWidget extends StatelessWidget {
  final int dotLength;
  final List activeDotList;
  const DotIndicatorWidget({
    Key? key,
    required this.dotLength,
    required this.activeDotList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < dotLength; i++)
          Container(
            margin: dotLength == i + 1
                ? null
                : context.paddingOnlyRight(12), //remark
            height: 1.58.h, //remark
            width: 3.05.w, //remark
            decoration: AppBoxDecorations.kDotIndicatorDecoration(
                activeDotList.contains(i)),
          ),
      ],
    );
  }
}

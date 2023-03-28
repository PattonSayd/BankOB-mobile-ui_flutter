import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/extensions/context_extension.dart';

class MiniCardWidget extends StatelessWidget {
  final List<dynamic> miniCardsList;
  final Widget Function(int) onReturn;

  const MiniCardWidget({
    super.key,
    required this.miniCardsList,
    required this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 17.12.h, //remark
      child: ListView.separated(
        padding: context.paddingHorizontal16,
        separatorBuilder: (context, index) => SizedBox(width: 2.h),
        scrollDirection: Axis.horizontal,
        itemCount: miniCardsList.length,
        itemBuilder: (context, index) => onReturn(index),
      ),
    );
  }
}

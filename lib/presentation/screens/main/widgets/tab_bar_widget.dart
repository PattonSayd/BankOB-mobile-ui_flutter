import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../app/extensions/context_extension.dart';

class TabBarWidget extends StatelessWidget {
  final List<dynamic> tabBarItems;
  final Widget Function(int) onReturn;
  const TabBarWidget({
    super.key,
    required this.tabBarItems,
    required this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(121, 126, 128, 0.02),
          borderRadius: context.borderRadiusAll8,
        ),
        height: 4.3.h,
        child: ListView.builder(
          itemCount: tabBarItems.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => onReturn(index),
        ),
      ),
    );
  }
}

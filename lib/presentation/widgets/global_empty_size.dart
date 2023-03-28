import 'package:flutter/material.dart';

class GlobalEmptySize extends StatelessWidget {
  const GlobalEmptySize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SizedBox(),
    );
  }
}

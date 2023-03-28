import 'package:bank_of_baku_app/app/styles/app_box_decorations.dart';
import 'package:flutter/material.dart';

import '../../app/styles/app_text_styles.dart';

enum RadioButton {
  selcetFirst,
  selectSecond,
}

class RadioButtonWithDecoration extends StatefulWidget {
  final int index;
  final RadioButton select;
  final String text;

  const RadioButtonWithDecoration({
    super.key,
    required this.index,
    required this.select,
    required this.text,
  });

  @override
  State<RadioButtonWithDecoration> createState() =>
      _RadioButtonWithDecorationState();
}

class _RadioButtonWithDecorationState extends State<RadioButtonWithDecoration> {
  RadioButton? currentSelect = RadioButton.selcetFirst;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: AppBoxDecorations.kRadioButtonWithBoxDecoration(context),
      child: RadioListTile<RadioButton>(
        contentPadding: const EdgeInsets.only(left: 8, top: 4, right: 4),
        tileColor: Colors.transparent,
        selectedTileColor: Colors.transparent,
        value: widget.select,
        groupValue: currentSelect,
        onChanged: (value) {
          setState(() {
            currentSelect = value;
          });
        },
        title: Align(
            alignment: const Alignment(-80, 0),
            child: Text(
              widget.text,
              style: AppTextStyles.kRadioBoxTextStyle,
            )),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}

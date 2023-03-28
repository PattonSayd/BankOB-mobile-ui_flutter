import 'package:flutter/material.dart';

class GlobalRadioButton extends StatefulWidget {
  const GlobalRadioButton({super.key});

  @override
  State<GlobalRadioButton> createState() => _GlobalRadioButtonState();
}

class _GlobalRadioButtonState extends State<GlobalRadioButton> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Radio<int>(
      value: 0,
      groupValue: currentIndex,
      onChanged: (int? value) {
        setState(() {
          currentIndex = value!;
        });
      },
    );
  }
}

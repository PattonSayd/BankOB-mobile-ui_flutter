import 'package:flutter/material.dart';

class ChartIncomeSalaryText extends StatelessWidget {
  final double income;
  
  const ChartIncomeSalaryText({
    Key? key,
    required this.income,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      style: const TextStyle(color: Colors.black),
      children: <TextSpan>[
        TextSpan(
          text: income.toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(
            text: ' ₼',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      ],
    ));
  }
}

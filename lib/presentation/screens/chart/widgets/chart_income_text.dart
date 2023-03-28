import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ChartIncomeText extends StatelessWidget {
  final Color color;

  const ChartIncomeText({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(width: 10),
        Text(appLocalizations.income),
      ],
    );
  }
}

import 'package:bank_of_baku_app/app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/styles/app_box_decorations.dart';
import '../../../app/themes/app_colors.dart';
import 'widgets/chart_income_salary_text.dart';
import 'widgets/chart_income_text.dart';
import 'widgets/chart_widget.dart';
import 'viewmodel/chart_model.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  double income = 1265;
  late List<ChartModel> _data1;
  late List<ChartModel> _data2;

  @override
  void initState() {
    super.initState();
    _data1 = [
      ChartModel('May', 1000),
      ChartModel('June', 1200),
      ChartModel('July', 1100),
      ChartModel('Avq', 1000),
      ChartModel('Sep', 1300),
      ChartModel('Oct', 1500),
      ChartModel('Nov', 1700),
      ChartModel('Dec', 1500),
    ];

    _data2 = [
      ChartModel('May', 900),
      ChartModel('June', 1100),
      ChartModel('July', 1000),
      ChartModel('Avq', 900),
      ChartModel('Sep', 1200),
      ChartModel('Oct', 1400),
      ChartModel('Nov', 1600),
      ChartModel('Dec', 1400),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecorations.kScaffoldDecoration(context),
      child: Scaffold(
        body: Padding(
          padding: context.paddingHorizontal16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIncome(AppColors.instance.primaryColor),
                  _buildIncome(AppColors.instance.chartSecondLineColor),
                ],
              ),
              SizedBox(height: 3.6.h),
              ChartWidget(
                data1: _data1,
                data2: _data2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncome(Color color) => Row(
        children: [
          ChartIncomeText(color: color),
          ChartIncomeSalaryText(income: income),
        ],
      );
}

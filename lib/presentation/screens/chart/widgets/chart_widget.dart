import 'package:bank_of_baku_app/presentation/screens/chart/viewmodel/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/themes/app_colors.dart';

class ChartWidget extends StatelessWidget {
  final List<ChartModel> data1;
  final List<ChartModel> data2;

  const ChartWidget({
    super.key,
    required this.data1,
    required this.data2,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(
            width: 0.5, color: Colors.transparent, dashArray: <double>[5, 5]),
        axisLine: AxisLine(
            color: AppColors.instance.chartDashColor,
            width: 0.5,
            dashArray: <double>[5, 5]),
        opposedPosition: false,
      ),
      primaryYAxis: CategoryAxis(
          axisLine: const AxisLine(
              color: Colors.white, width: 0, dashArray: <double>[5, 5]),
          majorGridLines: MajorGridLines(
              width: 0.5,
              color: AppColors.instance.chartDashColor,
              dashArray: const <double>[5, 5]),
          minimum: 213,
          maximum: 2023,
          interval: 603.2,
          opposedPosition: true),
      series: <ChartSeries<ChartModel, String>>[
        SplineSeries<ChartModel, String>(
          dataSource: data1,
          xValueMapper: (ChartModel sales, _) => sales.month,
          yValueMapper: (ChartModel sales, _) => sales.salary,
          color: AppColors.instance.primaryColor,
        ),
        SplineSeries<ChartModel, String>(
          dataSource: data2,
          xValueMapper: (ChartModel sales, _) => sales.month,
          yValueMapper: (ChartModel sales, _) => sales.salary,
          color: AppColors.instance.chartSecondLineColor,
        )
      ],
    );
  }
}

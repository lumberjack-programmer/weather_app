import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<SalesData> data = [
    SalesData('12AM', 16),
    SalesData('NOON', 17),
    SalesData('3PM', 27),
    SalesData('6PM', 32),
    SalesData('9PM', 32),
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            legend: Legend(isVisible: true),

            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                  dataSource: data,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  name: 'Temp',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]),
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     //Initialize the spark charts widget
        //     child: SfSparkLineChart.custom(
        //       //Enable the trackball
        //       trackball: SparkChartTrackball(
        //           activationMode: SparkChartActivationMode.tap),
        //       //Enable marker
        //       marker: SparkChartMarker(
        //           displayMode: SparkChartMarkerDisplayMode.all),
        //       //Enable data label
        //       labelDisplayMode: SparkChartLabelDisplayMode.all,
        //       xValueMapper: (int index) => data[index].year,
        //       yValueMapper: (int index) => data[index].sales,
        //       dataCount: 5,
        //     ),
        //   ),
        // )

      ],
    );
  }
}


class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}



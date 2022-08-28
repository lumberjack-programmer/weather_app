import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {

  final List<TemperatureTimeData> weatherForecastList;


  Chart({ required this.weatherForecastList});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {




  // List<TemperatureTimeData> data = [
  //   TemperatureTimeData(time: '12AM', temp: 16),
  //   TemperatureTimeData(time: 'NOON', 17.5),
  //   TemperatureTimeData('3PM', 27),
  //   TemperatureTimeData('6PM', 32),
  //   TemperatureTimeData('9PM', 32),
  //
  // ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            //Initialize the spark charts widget
            child: SfSparkLineChart.custom(
              //Enable the trackball
              trackball: SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap),
              //Enable marker
              marker: SparkChartMarker(
                  displayMode: SparkChartMarkerDisplayMode.all),
              //Enable data label
              labelDisplayMode: SparkChartLabelDisplayMode.all,
              xValueMapper: (int index) => widget.weatherForecastList[index].time,
              yValueMapper: (int index) => widget.weatherForecastList[index].temp,
              dataCount: 10,
            ),
          ),
        ),

        SizedBox(height: 30.0,),
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            legend: Legend(isVisible: false),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<TemperatureTimeData, String>>[
              LineSeries<TemperatureTimeData, String>(
                  dataSource: widget.weatherForecastList,
                  xValueMapper: (TemperatureTimeData sales, _) => sales.time,
                  yValueMapper: (TemperatureTimeData sales, _) => sales.temp,
                  name: 'Temp',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]),


      ],
    );
  }
}


class TemperatureTimeData {
  TemperatureTimeData({required this.temp, required this.time});

  final String time;
  final num temp;
}



import 'package:demo_app/core/models/other_models/dashboard_models/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class SplineChart extends StatelessWidget {
  const SplineChart({
    super.key,
    required this.chartData1,
    required this.chartData2,
    required this.firstChartColor,
    required this.secondChartColor,
  });

  final List<ChartData> chartData1;
  final List<ChartData> chartData2;
  final Color firstChartColor;
  final Color secondChartColor;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfCartesianChart(
          margin: EdgeInsets.zero,
          plotAreaBorderWidth: 0,
           primaryXAxis: const NumericAxis( 
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0), 
          ), 
         
          primaryYAxis:const NumericAxis( 
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0) 
         ), 
              series: <CartesianSeries>[
                
                  SplineSeries<ChartData, int>(
                    
                    splineType: SplineType.cardinal,
                    width: 3,
                    isVisibleInLegend: false,
                    color: firstChartColor,
                    enableTooltip: false,
                      dataSource: chartData1,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                      )
                  ]
              ),
              SfCartesianChart(
          margin: EdgeInsets.zero,
          plotAreaBorderWidth: 0,
           primaryXAxis: const NumericAxis( 
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0), 
          ), 
         
          primaryYAxis:const NumericAxis( 
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0) 
         ), 
              series: <CartesianSeries>[
                  SplineSeries<ChartData, int>(
                    splineType: SplineType.cardinal,
                    width: 3,
                    isVisibleInLegend: false,
                    color: secondChartColor,
                    enableTooltip: false,
                      dataSource: chartData2,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                      )
                  ]
              ),
      ],
    );
  }
}



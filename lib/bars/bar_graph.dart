import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:water_intake/bars/bar_data.dart';

class BarGraph extends StatelessWidget {
  final double maxY;
  final double sunWaterAmount;
  final double monWaterAmount;
  final double tueWaterAmount;
  final double wedWaterAmount;
  final double thuWaterAmount;
  final double friWaterAmount;
  final double satWaterAmount;

  const BarGraph({
    super.key,
    required this.maxY,
    required this.sunWaterAmount,
    required this.monWaterAmount,
    required this.tueWaterAmount,
    required this.wedWaterAmount,
    required this.thuWaterAmount,
    required this.friWaterAmount,
    required this.satWaterAmount,
  });

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      sunWaterIntake: sunWaterAmount,
      monWaterIntake: monWaterAmount,
      tueWaterIntake: tueWaterAmount,
      wedWaterIntake: wedWaterAmount,
      thuWaterIntake: thuWaterAmount,
      friWaterIntake: friWaterAmount,
      satWaterIntake: satWaterAmount,
    );

    barData.initBarData();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BarChart(
        BarChartData(
          maxY: maxY,
          minY: 0,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTitlesWidget,
              ),
            ),
          ),
          barGroups: barData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y.toDouble(),
                      color: Colors.lightGreen[700],
                      width: 23,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: maxY,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget getBottomTitlesWidget(double value, TitleMeta meta) {
    const TextStyle style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 24, 23, 23),
    );

    Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text('S', style: style);
        break;
      case 1:
        text = Text('M', style: style);
        break;
      case 2:
        text = Text('T', style: style);
        break;
      case 3:
        text = Text('W', style: style);
        break;
      case 4:
        text = Text('T', style: style);
        break;
      case 5:
        text = Text('F', style: style);
        break;
      case 6:
        text = Text('S', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(child: text, meta: meta, space: 3);
  }
}

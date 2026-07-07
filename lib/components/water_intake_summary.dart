import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_intake/data/water_data.dart';
import 'package:water_intake/bars/bar_graph.dart';

class WaterSummary extends StatefulWidget {
  final DateTime startOfWeek;

  const WaterSummary({super.key, required this.startOfWeek});

  @override
  State<WaterSummary> createState() => _WaterSummaryState();
}

class _WaterSummaryState extends State<WaterSummary> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WaterData>(
      builder: (context, waterData, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 200,
            child: BarGraph(
              maxY: 10,
              sunWaterAmount: 2.0,
              monWaterAmount: 4.5,
              tueWaterAmount: 3.0,
              wedWaterAmount: 6.0,
              thuWaterAmount: 5.5,
              friWaterAmount: 7.0,
              satWaterAmount: 1.5,
            ),
          ),
        );
      },
    );
  }
}

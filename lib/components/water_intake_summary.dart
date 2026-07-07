import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_intake/data/water_data.dart';
import 'package:water_intake/bars/bar_graph.dart';
import 'package:water_intake/utils/date_helper.dart';

class WaterSummary extends StatefulWidget {
  final DateTime startOfWeek;

  const WaterSummary({super.key, required this.startOfWeek});

  @override
  State<WaterSummary> createState() => _WaterSummaryState();
}

class _WaterSummaryState extends State<WaterSummary> {
  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(
      widget.startOfWeek.add(Duration(days: 0)),
    );
    String monday = convertDateTimeToString(
      widget.startOfWeek.add(Duration(days: 1)),
    );
    String tuesday = convertDateTimeToString(
      widget.startOfWeek.add(Duration(days: 2)),
    );
    String wednesday = convertDateTimeToString(
      widget.startOfWeek.add(Duration(days: 3)),
    );
    String thursday = convertDateTimeToString(
      widget.startOfWeek.add(Duration(days: 4)),
    );
    String friday = convertDateTimeToString(
      widget.startOfWeek.add(Duration(days: 5)),
    );
    String saturday = convertDateTimeToString(
      widget.startOfWeek.add(Duration(days: 6)),
    );

    return Consumer<WaterData>(
      builder: (context, waterData, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 200,
            child: BarGraph(
              maxY: 100,
              sunWaterAmount:
                  waterData.calculateDailyWaterSummary()[sunday] ?? 0,
              monWaterAmount:
                  waterData.calculateDailyWaterSummary()[monday] ?? 0,
              tueWaterAmount:
                  waterData.calculateDailyWaterSummary()[tuesday] ?? 0,
              wedWaterAmount:
                  waterData.calculateDailyWaterSummary()[wednesday] ?? 0,
              thuWaterAmount:
                  waterData.calculateDailyWaterSummary()[thursday] ?? 0,
              friWaterAmount:
                  waterData.calculateDailyWaterSummary()[friday] ?? 0,
              satWaterAmount:
                  waterData.calculateDailyWaterSummary()[saturday] ?? 0,
            ),
          ),
        );
      },
    );
  }
}

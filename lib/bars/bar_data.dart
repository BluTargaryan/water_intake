import 'individual_bar.dart';

class BarData {
  final double sunWaterIntake;
  final double monWaterIntake;
  final double tueWaterIntake;
  final double wedWaterIntake;
  final double thuWaterIntake;
  final double friWaterIntake;
  final double satWaterIntake;

  BarData({
    required this.sunWaterIntake,
    required this.monWaterIntake,
    required this.tueWaterIntake,
    required this.wedWaterIntake,
    required this.thuWaterIntake,
    required this.friWaterIntake,
    required this.satWaterIntake,
  });

  List<IndividualBar> barData = [];

  void initBarData() {
    barData = [
      IndividualBar(x: 0, y: sunWaterIntake.toInt()),
      IndividualBar(x: 1, y: monWaterIntake.toInt()),
      IndividualBar(x: 2, y: tueWaterIntake.toInt()),
      IndividualBar(x: 3, y: wedWaterIntake.toInt()),
      IndividualBar(x: 4, y: thuWaterIntake.toInt()),
      IndividualBar(x: 5, y: friWaterIntake.toInt()),
      IndividualBar(x: 6, y: satWaterIntake.toInt()),
    ];
  }
}

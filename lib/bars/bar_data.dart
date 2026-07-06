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
    barData = [IndividualBar(x: 0, y: sunWaterIntake.toInt())];
  }
}

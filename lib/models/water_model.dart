class WaterModel {
  final String? id;
  final double amount;
  final DateTime datetime;

  WaterModel({
    this.id,
    required this.amount,
    required this.datetime,
    required String unit,
  });

  factory WaterModel.fromJson(Map<String, dynamic> json) {
    return WaterModel(
      id: json['id'],
      amount: json['amount'],
      datetime: DateTime.parse(json['datetime']),
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'datetime': DateTime.now()};
  }
}

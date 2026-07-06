class IndividualBar {
  final int x;
  final int y;

  IndividualBar({required this.x, required this.y});

  factory IndividualBar.fromJson(Map<String, dynamic> json) {
    return IndividualBar(x: json['x'], y: json['y']);
  }
}

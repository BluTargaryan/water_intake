import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:water_intake/models/water_model.dart';
import 'package:http/http.dart' as http;

class WaterData extends ChangeNotifier {
  List<WaterModel> waterDataList = [];

  void addWater(WaterModel water) async {
    final url = Uri.https(
      "water-intake-54779-default-rtdb.firebaseio.com",
      "water-intake.json",
    );

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "amount": double.parse(water.amount.toString()),
        'unit': 'ml',
        'datetime': water.datetime.toString(),
      }),
    );
    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      waterDataList.add(
        WaterModel(
          id: extractedData['name'],
          amount: double.parse(water.amount.toString()),
          datetime: water.datetime,
          unit: 'ml',
        ),
      );
    } else {
      throw Exception('Failed to save water');
    }

    notifyListeners();
  }

  Future<List<WaterModel>> getWaterData() async {
    waterDataList.clear();

    final url = Uri.https(
      "water-intake-54779-default-rtdb.firebaseio.com",
      "water-intake.json",
    );

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != null) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      for (var element in extractedData.entries) {
        waterDataList.add(
          WaterModel(
            amount: element.value['amount'],
            datetime: DateTime.parse(element.value['datetime']),
            unit: element.value['unit'],
          ),
        );
      }
      notifyListeners();
      return waterDataList;
    }
    return [];
  }
}

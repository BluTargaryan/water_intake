import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:water_intake/data/water_data.dart';
import 'package:water_intake/models/water_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final amountController = TextEditingController(text: 'hello');

  @override
  void initState() {
    Provider.of<WaterData>(context, listen: false).getWaterData();
    super.initState();
  }

  void saveWater() async {
    Provider.of<WaterData>(context, listen: false).addWater(
      WaterModel(
        amount: double.parse(amountController.text),
        datetime: DateTime.now(),
        unit: 'ml',
      ),
    );

    if (!context.mounted) {
      return;
    }
  }

  void addWater() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Water'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add water to your daily goal intake'),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              saveWater();
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WaterData>(
      builder: (context, waterData, child) => Scaffold(
        appBar: AppBar(
          elevation: 4,
          centerTitle: true,
          title: Text('Water Intake'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.map))],
        ),
        body: ListView.builder(
          itemCount: waterData.waterDataList.length,
          itemBuilder: (context, index) {
            final waterModel = waterData.waterDataList[index];
            return ListTile(title: Text(waterModel.amount.toString()));
          },
        ),

        backgroundColor: Theme.of(context).colorScheme.surface,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: addWater,
        ),
      ),
    );
  }
}

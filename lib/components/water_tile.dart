import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_intake/models/water_model.dart';
import 'package:water_intake/data/water_data.dart';

class WaterTile extends StatelessWidget {
  const WaterTile({super.key, required this.waterModel});

  final WaterModel waterModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Icon(Icons.water_drop, size: 20, color: Colors.blue),
            Text(
              '${waterModel.amount.toStringAsFixed(2)} ml',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        subtitle: Text(
          '${waterModel.datetime.day}/${waterModel.datetime.month}/${waterModel.datetime.year}',
        ),
        trailing: IconButton(
          onPressed: () {
            Provider.of<WaterData>(context, listen: false).delete(waterModel);
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}

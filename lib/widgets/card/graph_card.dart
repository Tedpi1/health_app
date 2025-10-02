import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../functions/methods/generalfunctions.dart';
import '../models/models.dart';



Widget graphsWidget({
  required List<String> titles,
  required List<List<ChartData>> data,
}) {
  return Column(
    crossAxisAlignment:
    CrossAxisAlignment.stretch, // make cards take full width
    children: List.generate(titles.length, (index) {
      return Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titles[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries>[
                    ColumnSeries<ChartData, String>(
                      dataSource: data[index],
                      xValueMapper: (ChartData sales, _) => sales.x,
                      yValueMapper: (ChartData sales, _) => sales.y,
                      color: getRandomColor(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}



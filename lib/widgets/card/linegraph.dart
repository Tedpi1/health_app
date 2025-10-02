import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../functions/methods/generalfunctions.dart';
import '../models/models.dart';
import 'graph_card.dart';



Widget linesgraph({
  required List<String> titles,
  required List<List<ChartData>> data,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  legend: Legend(isVisible: true),
                  series: <CartesianSeries>[
                    LineSeries<ChartData, String>(
                      dataSource: data[index],
                      xValueMapper: (ChartData point, _) => point.x,
                      yValueMapper: (ChartData point, _) => point.y,
                      color: Colors.blue, // line color
                      width: 2, // line thickness
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                        shape: DataMarkerType.circle,
                        borderWidth: 2,
                      ),
                      name: 'Line',
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

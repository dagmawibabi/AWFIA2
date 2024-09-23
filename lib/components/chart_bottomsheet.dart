import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartBottomsheet extends StatefulWidget {
  final Map<String, dynamic> crypto;

  const ChartBottomsheet({super.key, required this.crypto});

  @override
  State<ChartBottomsheet> createState() => _ChartBottomsheetState();
}

class _ChartBottomsheetState extends State<ChartBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.crypto['name']} Price Chart',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // TODO FIX THE CHART DATA
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 7,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 3),
                      const FlSpot(1, 1),
                      const FlSpot(2, 4),
                      const FlSpot(3, 2),
                      const FlSpot(4, 5),
                      const FlSpot(5, 1),
                      const FlSpot(6, 4),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

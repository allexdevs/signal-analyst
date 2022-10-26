// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 349,
      height: 150,
      child: DChartBar(
        data: const [
          {
            'id': 'Bar',
            'data': [
              {'domain': '% Call', 'measure': 3},
              {'domain': '% Put', 'measure': 4},
              {'domain': 'Call', 'measure': 6},
              {'domain': 'Put', 'measure': 2.3},
            ]
          }
        ],
        barColor: (barData, index, id) => index == 0
            ? Colors.blue
            : index == 1
                ? Colors.green
                : index == 2
                    ? Colors.red
                    : Colors.amber,
        verticalDirection: false,
        yAxisTitle: "Metrics",
        showBarValue: true,
        domainLabelColor: const Color(0xFF999999),
        measureAxisTitleInPadding: 14,
        measureAxisTitleColor: const Color(0xFF999999),
        measureLabelColor: const Color(0xFF999999),
      ),
    );
  }
}

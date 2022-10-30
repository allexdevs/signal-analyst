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
              {'domain': '% Call', 'measure': 69},
              {'domain': '% Put', 'measure': 30},
              {'domain': 'Call', 'measure': 9},
              {'domain': 'Put', 'measure': 4},
            ]
          },
        ],
        barColor: (barData, index, id) => index == 0
            ? Colors.blue
            : index == 1
                ? Colors.amber
                : index == 2
                    ? Colors.green
                    : Colors.red,
        verticalDirection: false,
        measureMax: 100,
        axisLineTick: 1,
        animate: true,
        yAxisTitle: "Metrics",
        domainLabelColor: const Color(0xFF999999),
        measureLabelFontSize: 12,
        domainLabelPaddingToAxisLine: 6,
        measureAxisTitleInPadding: 14,
        measureAxisTitleColor: const Color(0xFF999999),
        measureLabelColor: const Color(0xFF999999),
      ),
    );
  }
}

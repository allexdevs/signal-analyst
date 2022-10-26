// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 101,
      child: DChartBar(
        data: const [
          {
            'id': 'Bar',
            'data': [
              {'domain': '2020', 'measure': 3},
              {'domain': '2021', 'measure': 4},
              {'domain': '2022', 'measure': 6},
              {'domain': '2023', 'measure': 0.3},
            ]
          }
        ],
        barColor: (barData, index, id) => Colors.green,
        verticalDirection: false,
      ),
    );
  }
}

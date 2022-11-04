// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget(
      {super.key,
      required this.callPercent,
      required this.purPercent,
      required this.callAmount,
      required this.putAmount});

  final double callPercent;
  final double purPercent;
  final int callAmount;
  final int putAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 349,
      height: 150,
      child: DChartBar(
        data: [
          {
            'id': 'Bar',
            'data': [
              {
                'domain': '% Call',
                'measure': double.parse(callPercent.toStringAsFixed(2))
              },
              {
                'domain': '% Put',
                'measure': double.parse(purPercent.toStringAsFixed(2))
              },
              {'domain': 'Call', 'measure': callAmount},
              {'domain': 'Put', 'measure': putAmount},
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
        measureMin: 0,
        axisLineTick: 1,
        animate: true,
        yAxisTitle: "Metrics",
        domainLabelColor: const Color(0xFF999999),
        measureLabelFontSize: 12,
        showMeasureLine: true,
        domainLabelPaddingToAxisLine: 6,
        measureAxisTitleInPadding: 14,
        measureAxisTitleColor: const Color(0xFF999999),
        measureLabelColor: const Color(0xFF999999),
        showBarValue: true,
        barValueFontSize: 10,
        barValueColor: const Color(0xFF999999),
        barValue: (barData, index) => index == 0
            ? '${barData['measure']} %'
            : index == 1
                ? '${barData['measure']} %'
                : index == 2
                    ? '${barData['measure']} Qtd.'
                    : '${barData['measure']} Qtd.',
        barValuePosition: BarValuePosition.outside,
      ),
    );
  }
}

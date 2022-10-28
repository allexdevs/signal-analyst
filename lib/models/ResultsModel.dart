// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ResultsModel {
  final String time;
  final String symbol;
  final int callAmount;
  final int putAmount;
  final double callPercent;
  final double putPercent;
  final IconData signalIcon;

  ResultsModel(this.time, this.symbol, this.callAmount, this.putAmount,
      this.callPercent, this.putPercent, this.signalIcon);
}

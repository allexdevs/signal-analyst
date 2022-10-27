import 'package:flutter/cupertino.dart';

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

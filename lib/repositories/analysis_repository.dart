// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class AnalysisRepository extends ChangeNotifier {
  String symbol = "EUR/USD";
  String timeframe = "5min";
  String startTime = "00:00:00";
  String endtTime = "00:00:00";
  double profitPercent = 0.0;

  void changeSymbol(String? value) {
    symbol = value!;
    notifyListeners();
  }

  void changeTimeframe(String? value) {
    timeframe = value!;
    notifyListeners();
  }

  void changeStartTime(String? value) {
    startTime = value.toString();
    notifyListeners();
  }

  void changeEndTime(String? value) {
    endtTime = value.toString();
    notifyListeners();
  }

  void changeProfitPercent(String? value) {
    profitPercent = double.parse(value!);
    notifyListeners();
  }

  void pullInfo() {
    Map<String, dynamic> model = {
      "symbol": symbol,
      "timeframe": timeframe,
      "startTime": startTime,
      "endTime": endtTime,
      "profit": profitPercent
    };

    print(model);
  }
}

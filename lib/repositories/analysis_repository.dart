// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:signal_analyst/models/raw_values.dart';
import 'package:signal_analyst/services/api_service.dart';

class AnalysisRepository extends ChangeNotifier {
  String symbol = "EUR/USD";
  String timeframe = "5min";
  String startTime = "00:00:00";
  String endTime = "00:00:00";
  double profitPercent = 0.0;
  ApiService apiService = ApiService();
  List<RawValues> formatedValues = [];

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
    endTime = value.toString();
    notifyListeners();
  }

  void changeProfitPercent(String? value) {
    value!.isNotEmpty ? profitPercent = double.parse(value) : 0.0;
    notifyListeners();
  }

  void pullInfo() {
    if (symbol.isEmpty || timeframe.isEmpty) return;
    var results = apiService.fetchData(symbol, timeframe);
    formatedValues.clear();

    results.then((value) {
      for (int i = 0; i < value.length; i++) {
        RawValues val = RawValues(
            "${DateTime.parse(value[i]['datetime']).day}/${DateTime.parse(value[i]['datetime']).month}/${DateTime.parse(value[i]['datetime']).year}",
            "${DateTime.parse(value[i]['datetime']).hour}:${DateTime.parse(value[i]['datetime']).minute}:${DateTime.parse(value[i]['datetime']).second}",
            value[i]['open'],
            value[i]['high'],
            value[i]['low'],
            value[i]['close']);
        formatedValues.add(val);
      }

      for (var item in formatedValues) {
        if (item.time.startsWith(startTime.substring(0, 2)) ||
            item.time.startsWith(endTime.substring(0, 2))) {
          print("${item.date} - ${item.time}");
        }
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}

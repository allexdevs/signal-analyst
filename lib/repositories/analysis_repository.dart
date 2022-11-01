// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signal_analyst/models/raw_values.dart';
import 'package:signal_analyst/models/results_model.dart';
import 'package:signal_analyst/services/api_service.dart';

class AnalysisRepository extends ChangeNotifier {
  String symbol = "EUR/JPY";
  String timeframe = "5min";
  String time = "00:00:00";
  double profitPercent = 0.0;
  ApiService apiService = ApiService();
  List<RawValues> formatedValues = [];
  List<ResultsModel> totalResults = [];

  void changeSymbol(String? value) {
    symbol = value!;
    notifyListeners();
  }

  void changeTimeframe(String? value) {
    timeframe = value!;
    notifyListeners();
  }

  void changeStartTime(String? value) {
    time = value.toString();
    notifyListeners();
  }

  void changeProfitPercent(String? value) {
    value!.isNotEmpty ? profitPercent = double.parse(value) : 0.0;
    notifyListeners();
  }

  void pullInfo() {
    if (symbol.isEmpty ||
        timeframe.isEmpty ||
        time.isEmpty ||
        profitPercent.toString().isEmpty) return;
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

      List<ResultsModel> results = [];
      List<int> totalGeral = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      List<int> totalCall = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      List<int> totalPut = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

      for (var item in formatedValues) {
        if (item.time.startsWith(time.substring(0, 2))) {
          if (item.time == "${time.substring(0, 2)}:0:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[0] = totalCall[0] += 1;
              totalGeral[0] = totalGeral[0] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[0] = totalPut[0] += 1;
              totalGeral[0] = totalGeral[0] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:5:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[1] = totalCall[1] += 1;
              totalGeral[1] = totalGeral[1] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[1] = totalPut[1] += 1;
              totalGeral[1] = totalGeral[1] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:10:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[2] = totalCall[2] += 1;
              totalGeral[2] = totalGeral[2] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[2] = totalPut[2] += 1;
              totalGeral[2] = totalGeral[2] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:15:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[3] = totalCall[3] += 1;
              totalGeral[3] = totalGeral[3] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[3] = totalPut[3] += 1;
              totalGeral[3] = totalGeral[3] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:20:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[4] = totalCall[4] += 1;
              totalGeral[4] = totalGeral[4] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[4] = totalPut[4] += 1;
              totalGeral[4] = totalGeral[4] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:25:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[5] = totalCall[5] += 1;
              totalGeral[5] = totalGeral[5] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[5] = totalPut[5] += 1;
              totalGeral[5] = totalGeral[5] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:30:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[6] = totalCall[6] += 1;
              totalGeral[6] = totalGeral[6] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[6] = totalPut[6] += 1;
              totalGeral[6] = totalGeral[6] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:35:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[7] = totalCall[7] += 1;
              totalGeral[7] = totalGeral[7] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[7] = totalPut[7] += 1;
              totalGeral[7] = totalGeral[7] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:40:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[8] = totalCall[8] += 1;
              totalGeral[8] = totalGeral[8] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[8] = totalPut[8] += 1;
              totalGeral[8] = totalGeral[8] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:45:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[9] = totalCall[9] += 1;
              totalGeral[9] = totalGeral[9] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[9] = totalPut[9] += 1;
              totalGeral[9] = totalGeral[9] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:50:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[10] = totalCall[10] += 1;
              totalGeral[10] = totalGeral[10] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[10] = totalPut[10] += 1;
              totalGeral[10] = totalGeral[10] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:55:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              totalCall[11] = totalCall[11] += 1;
              totalGeral[11] = totalGeral[11] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalPut[11] = totalPut[11] += 1;
              totalGeral[11] = totalGeral[11] += 1;
            }
          }
        }
      }

      for (int i = 0; i < 12; i++) {
        ResultsModel result = ResultsModel(
            i == 0
                ? "${time.substring(0, 2)}:00:00"
                : i == 1
                    ? "${time.substring(0, 2)}:05:00"
                    : i == 2
                        ? "${time.substring(0, 2)}:10:00"
                        : i == 3
                            ? "${time.substring(0, 2)}:15:00"
                            : i == 4
                                ? "${time.substring(0, 2)}:20:00"
                                : i == 5
                                    ? "${time.substring(0, 2)}:25:00"
                                    : i == 6
                                        ? "${time.substring(0, 2)}:30:00"
                                        : i == 7
                                            ? "${time.substring(0, 2)}:35:00"
                                            : i == 8
                                                ? "${time.substring(0, 2)}:40:00"
                                                : i == 9
                                                    ? "${time.substring(0, 2)}:45:00"
                                                    : i == 10
                                                        ? "${time.substring(0, 2)}:50:00"
                                                        : "${time.substring(0, 2)}:55:00",
            symbol,
            totalCall[i],
            totalPut[i],
            (totalCall[i] / totalGeral[i]) * 100,
            (totalPut[i] / totalGeral[i]) * 100,
            totalCall[i] > totalPut[i]
                ? FontAwesomeIcons.circleChevronUp
                : FontAwesomeIcons.circleChevronDown,
            totalCall[i] > totalPut[i]
                ? const Color(0xFF1DBE0F)
                : const Color(0xFFC34848));
        results.add(result);
      }

      totalResults = results;
      print(totalResults);

      notifyListeners();
    }).catchError((onError) {
      print(onError);
    });
  }
}

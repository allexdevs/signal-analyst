// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signal_analyst/models/chart_values_model.dart';
import 'package:signal_analyst/models/details_model.dart';
import 'package:signal_analyst/models/raw_values.dart';
import 'package:signal_analyst/models/results_model.dart';
import 'package:signal_analyst/services/api_service.dart';

class AnalysisRepository extends ChangeNotifier {
  String symbol = "EUR/JPY";
  String timeframe = "5min";
  String time = "00:00:00";
  double profitPercent = 60.0;
  ApiService apiService = ApiService();
  List<RawValues> formatedValues = [];
  List<ResultsModel> totalResults = [];
  List<ChartValuesModel> totalChartValues = [];
  List<dynamic> totalDetailsValues = [
    {"list0": []},
    {"list1": []},
    {"list2": []},
    {"list3": []},
    {"list4": []},
    {"list5": []},
    {"list6": []},
    {"list7": []},
    {"list8": []},
    {"list9": []},
    {"list10": []},
    {"list11": []},
  ];
  List<dynamic> details = [];
  double callPercent = 0.0;
  double putPercent = 0.0;
  int callAmount = 0;
  int putAmount = 0;

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
    totalResults.clear();
    totalDetailsValues = [
      {"list0": []},
      {"list1": []},
      {"list2": []},
      {"list3": []},
      {"list4": []},
      {"list5": []},
      {"list6": []},
      {"list7": []},
      {"list8": []},
      {"list9": []},
      {"list10": []},
      {"list11": []},
    ];
    details = [];
    callPercent = 0.0;
    putPercent = 0.0;
    callAmount = 0;
    putAmount = 0;

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

      List<int> grandTotal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      List<int> purchaseTotal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      List<int> totalSales = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

      for (var item in formatedValues) {
        if (item.time.startsWith(time.substring(0, 2)) ||
            item.time.startsWith(time.substring(0, 1))) {
          if (item.time == "${time.substring(0, 2)}:0:0" ||
              item.time == "${time.substring(0, 1)}:0:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[0] = purchaseTotal[0] += 1;
              grandTotal[0] = grandTotal[0] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[0] = totalSales[0] += 1;
              grandTotal[0] = grandTotal[0] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:5:0" ||
              item.time == "${time.substring(0, 1)}:5:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[1] = purchaseTotal[1] += 1;
              grandTotal[1] = grandTotal[1] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[1] = totalSales[1] += 1;
              grandTotal[1] = grandTotal[1] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:10:0" ||
              item.time == "${time.substring(0, 1)}:10:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[2] = purchaseTotal[2] += 1;
              grandTotal[2] = grandTotal[2] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[2] = totalSales[2] += 1;
              grandTotal[2] = grandTotal[2] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:15:0" ||
              item.time == "${time.substring(0, 1)}:15:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[3] = purchaseTotal[3] += 1;
              grandTotal[3] = grandTotal[3] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[3] = totalSales[3] += 1;
              grandTotal[3] = grandTotal[3] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:20:0" ||
              item.time == "${time.substring(0, 1)}:20:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[4] = purchaseTotal[4] += 1;
              grandTotal[4] = grandTotal[4] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[4] = totalSales[4] += 1;
              grandTotal[4] = grandTotal[4] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:25:0" ||
              item.time == "${time.substring(0, 1)}:25:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[5] = purchaseTotal[5] += 1;
              grandTotal[5] = grandTotal[5] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[5] = totalSales[5] += 1;
              grandTotal[5] = grandTotal[5] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:30:0" ||
              item.time == "${time.substring(0, 1)}:30:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[6] = purchaseTotal[6] += 1;
              grandTotal[6] = grandTotal[6] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[6] = totalSales[6] += 1;
              grandTotal[6] = grandTotal[6] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:35:0" ||
              item.time == "${time.substring(0, 1)}:35:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[7] = purchaseTotal[7] += 1;
              grandTotal[7] = grandTotal[7] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[7] = totalSales[7] += 1;
              grandTotal[7] = grandTotal[7] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:40:0" ||
              item.time == "${time.substring(0, 1)}:40:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[8] = purchaseTotal[8] += 1;
              grandTotal[8] = grandTotal[8] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[8] = totalSales[8] += 1;
              grandTotal[8] = grandTotal[8] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:45:0" ||
              item.time == "${time.substring(0, 1)}:45:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[9] = purchaseTotal[9] += 1;
              grandTotal[9] = grandTotal[9] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[9] = totalSales[9] += 1;
              grandTotal[9] = grandTotal[9] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:50:0" ||
              item.time == "${time.substring(0, 1)}:50:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[10] = purchaseTotal[10] += 1;
              grandTotal[10] = grandTotal[10] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[10] = totalSales[10] += 1;
              grandTotal[10] = grandTotal[10] += 1;
            }
          }
          if (item.time == "${time.substring(0, 2)}:55:0" ||
              item.time == "${time.substring(0, 1)}:55:0") {
            if (double.parse(item.close) > double.parse(item.open)) {
              purchaseTotal[11] = purchaseTotal[11] += 1;
              grandTotal[11] = grandTotal[11] += 1;
            } else if (double.parse(item.close) < double.parse(item.open)) {
              totalSales[11] = totalSales[11] += 1;
              grandTotal[11] = grandTotal[11] += 1;
            }
          }
        }
      }

      for (int i = 0; i < 12; i++) {
        String formatedTime = "";
        if (i == 0) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:00:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:00:00";
          }
        } else if (i == 1) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:05:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:05:00";
          }
        } else if (i == 2) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:10:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:10:00";
          }
        } else if (i == 3) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:15:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:15:00";
          }
        } else if (i == 4) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:20:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:20:00";
          }
        } else if (i == 5) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:25:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:25:00";
          }
        } else if (i == 6) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:30:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:30:00";
          }
        } else if (i == 7) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:35:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:35:00";
          }
        } else if (i == 8) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:40:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:40:00";
          }
        } else if (i == 9) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:45:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:45:00";
          }
        } else if (i == 10) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:50:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:50:00";
          }
        } else if (i == 11) {
          if (time.substring(0, 2) == "0:" ||
              time.substring(0, 2) == "1:" ||
              time.substring(0, 2) == "2:" ||
              time.substring(0, 2) == "3:" ||
              time.substring(0, 2) == "4:" ||
              time.substring(0, 2) == "5:" ||
              time.substring(0, 2) == "6:" ||
              time.substring(0, 2) == "7:" ||
              time.substring(0, 2) == "8:" ||
              time.substring(0, 2) == "9:") {
            formatedTime = "0${time.substring(0, 1)}:55:00";
          } else {
            formatedTime = "${time.substring(0, 2)}:55:00";
          }
        }

        ResultsModel result = ResultsModel(
            formatedTime,
            symbol,
            purchaseTotal[i],
            totalSales[i],
            (purchaseTotal[i] / grandTotal[i]) * 100,
            (totalSales[i] / grandTotal[i]) * 100,
            purchaseTotal[i] > totalSales[i]
                ? FontAwesomeIcons.circleChevronUp
                : FontAwesomeIcons.circleChevronDown,
            purchaseTotal[i] > totalSales[i]
                ? const Color(0xFF1DBE0F)
                : const Color(0xFFC34848));
        totalResults.add(result);
      }
      calculateChartValues();
      calculateDetailsValues();
      notifyListeners();
    }).catchError((onError) {
      print(onError);
    });
  }

  void calculateChartValues() {
    totalChartValues.clear();
    if (totalResults.isEmpty) return;
    for (int i = 0; i < totalResults.length; i++) {
      ChartValuesModel value = ChartValuesModel(
          totalResults[i].callPercent,
          totalResults[i].putPercent,
          totalResults[i].callAmount,
          totalResults[i].putAmount);
      totalChartValues.add(value);
    }
    notifyListeners();
  }

  void selectChartValues(int index) {
    if (totalChartValues.isEmpty) return;
    callPercent = totalChartValues[index].callPercent;
    putPercent = totalChartValues[index].putPercent;
    callAmount = totalChartValues[index].callAmount;
    putAmount = totalChartValues[index].putAmount;

    notifyListeners();
  }

  void calculateDetailsValues() {
    if (formatedValues.isEmpty) return;
    for (var item in formatedValues) {
      if (item.time.startsWith(time.substring(0, 2)) ||
          item.time.startsWith(time.substring(0, 1))) {
        if (item.time == "${time.substring(0, 2)}:0:0" ||
            item.time == "${time.substring(0, 1)}:0:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[0]["list0"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:5:0" ||
            item.time == "${time.substring(0, 1)}:5:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[1]["list1"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:10:0" ||
            item.time == "${time.substring(0, 1)}:10:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[2]["list2"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:15:0" ||
            item.time == "${time.substring(0, 1)}:15:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[3]["list3"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:20:0" ||
            item.time == "${time.substring(0, 1)}:20:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[4]["list4"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:25:0" ||
            item.time == "${time.substring(0, 1)}:25:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[5]["list5"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:30:0" ||
            item.time == "${time.substring(0, 1)}:30:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[6]["list6"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:35:0" ||
            item.time == "${time.substring(0, 1)}:35:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[7]["list7"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:40:0" ||
            item.time == "${time.substring(0, 1)}:40:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[8]["list8"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:45:0" ||
            item.time == "${time.substring(0, 1)}:45:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[9]["list9"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:50:0" ||
            item.time == "${time.substring(0, 1)}:50:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[10]["list10"].add(detail);
        }
        if (item.time == "${time.substring(0, 2)}:55:0" ||
            item.time == "${time.substring(0, 1)}:55:0") {
          int totalCall = 0;
          int totalPut = 0;

          double.parse(item.close) > double.parse(item.open)
              ? totalCall += 1
              : totalPut += 1;

          DetailsModel detail = DetailsModel(
              item.date,
              item.time,
              "",
              totalCall > totalPut
                  ? FontAwesomeIcons.circleArrowUp
                  : FontAwesomeIcons.circleArrowDown,
              totalCall > totalPut
                  ? const Color(0xFF1DBE0F)
                  : const Color(0xFFC34848));
          totalDetailsValues[11]["list11"].add(detail);
        }
      }
    }

    notifyListeners();
  }

  void selectDetailsValues(int index) {
    if (totalDetailsValues.isEmpty) return;
    index == 0 ? details = totalDetailsValues[index]["list0"] : [];
    index == 1 ? details = totalDetailsValues[index]["list1"] : [];
    index == 2 ? details = totalDetailsValues[index]["list2"] : [];
    index == 3 ? details = totalDetailsValues[index]["list3"] : [];
    index == 4 ? details = totalDetailsValues[index]["list4"] : [];
    index == 5 ? details = totalDetailsValues[index]["list5"] : [];
    index == 6 ? details = totalDetailsValues[index]["list6"] : [];
    index == 7 ? details = totalDetailsValues[index]["list7"] : [];
    index == 8 ? details = totalDetailsValues[index]["list8"] : [];
    index == 9 ? details = totalDetailsValues[index]["list9"] : [];
    index == 10 ? details = totalDetailsValues[index]["list10"] : [];
    index == 11 ? details = totalDetailsValues[index]["list11"] : [];

    notifyListeners();
  }
}

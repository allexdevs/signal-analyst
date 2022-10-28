// ignore_for_file: avoid_print

import 'package:signal_analyst/models/RawValues.dart';
import 'package:signal_analyst/services/api_service.dart';

class AnalysisController {
  List<dynamic> valores = [];
  List<RawValues> valoresFormatados = [];
  String symbol = "";
  String timeframe = "";
  String startTime = "";
  String edTime = "";

  void getRawData(symbol, timeframe) {
    ApiService apiService = ApiService();
    var valores = apiService.fetchData(symbol, timeframe);
    valores.then((value) => print(value)).onError((error, stackTrace) => null);
  }

  void formatedData() {}
}

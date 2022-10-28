// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class ApiService {
  ApiService();

  Future<List<dynamic>> fetchData(String symbol, String timeframe) async {
    List<dynamic> valores = [];
    try {
      var response = await Dio().post(
          "https://api.twelvedata.com/complex_data?apikey=dbdd3ba9e5c3435b94626c92d290883a",
          data: {
            "symbols": [symbol],
            "intervals": [timeframe],
            "outputsize": 5000,
            "dp": 6,
            "timezone": "America/Maceio",
            "methods": ["time_series"]
          });
      valores = response.data["data"][0]["values"];
      // print(response.data["data"][0]["values"]);
    } catch (e) {
      print(e);
    }

    return valores;
  }
}

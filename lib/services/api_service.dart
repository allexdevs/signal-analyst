// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class ApiService {
  ApiService();

  void fetchData() async {
    try {
      var response = await Dio().post(
          "https://api.twelvedata.com/complex_data?apikey=dbdd3ba9e5c3435b94626c92d290883a",
          data: {
            "symbols": ["EUR/USD"],
            "intervals": ["5min"],
            "outputsize": 5000,
            "dp": 6,
            "timezone": "America/Maceio",
            "methods": ["time_series"]
          });
      print(response.data["data"][0]["values"]);
    } catch (e) {
      print(e);
    }
  }
}

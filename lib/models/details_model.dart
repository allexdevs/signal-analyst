// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DetailsModel {
  final String date;
  final String time;
  final String dayOfWeek;
  final IconData signal;
  final Color signalColor;

  DetailsModel(
      this.date, this.time, this.dayOfWeek, this.signal, this.signalColor);
}

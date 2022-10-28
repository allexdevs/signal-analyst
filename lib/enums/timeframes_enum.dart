enum TimeframesEnum {
  min1(text: "1 Minuto", value: "1min"),
  min5(text: "5 Minutos", value: "5min");

  const TimeframesEnum({required this.text, required this.value});

  final String text;
  final String value;
}

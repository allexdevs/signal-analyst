enum SymbolsEnum {
  eurJpy(text: "EUR/JPY", value: "EUR/JPY"),
  eurGbp(text: "EUR/GBP", value: "EUR/GBP"),
  eurUsd(text: "EUR/USD", value: "EUR/USD"),
  eurCad(text: "EUR/CAD", value: "EUR/CAD"),
  eurChf(text: "EUR/CHF", value: "EUR/CHF"),
  eurNzd(text: "EUR/NZD", value: "EUR/NZD"),
  gbpUsd(text: "GBP/USD", value: "GBP/USD"),
  gbpJpy(text: "GBP/JPY", value: "GBP/JPY"),
  gbpNzd(text: "GBP/NZD", value: "GBP/NZD"),
  audJpy(text: "AUD/JPY", value: "AUD/JPY"),
  audUsd(text: "AUD/USD", value: "AUD/USD"),
  audNzd(text: "AUD/NZD", value: "AUD/NZD"),
  audCad(text: "AUD/CAD", value: "AUD/CAD"),
  usdNok(text: "USD/NOK", value: "USD/NOK"),
  usdJpy(text: "USD/JPY", value: "USD/JPY"),
  usdCad(text: "USD/CAD", value: "USD/CAD"),
  usdChf(text: "USD/CHF", value: "USD/CHF");

  const SymbolsEnum({required this.text, required this.value});

  final String text;
  final String value;
}

import 'dart:convert';

class ExchangeRateModel {
  final String date;
  final double price;

  const ExchangeRateModel({required this.date, required this.price});

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    String currencyUnit = "";
    for (var element in json.keys) {
      if (element != "date") {
        currencyUnit = element;
      }
    }
    return ExchangeRateModel(
        date: json['date'] as String,
        price: double.parse(json[currencyUnit].toString()));
  }

  static ExchangeRateModel parseExchangeRate(String responseBody) {
    final Map<String, dynamic> parsed =
        (jsonDecode(responseBody)) as Map<String, dynamic>;

    return ExchangeRateModel.fromJson(parsed);
  }
}

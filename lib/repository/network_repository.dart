import 'package:toy_flutter/data/network/model/response/exchange_rate_model.dart';
import 'package:toy_flutter/data/network/module.dart';

class NetworkRepository {
  Future<ExchangeRateModel?> requestExchangeRate(String targetCurrency) async {
    String url = 'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/krw/$targetCurrency.min.json';
    final response = await NetworkModule.call(url);
    if (response.statusCode == 200) {
        return ExchangeRateModel.parseExchangeRate(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
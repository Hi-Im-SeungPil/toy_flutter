import 'dart:convert';

import 'package:toy_flutter/data/network/model/response/exchange_rate_model.dart';

class ParseData {
  static ExchangeRateModel parseExchangeRate(String responseBody) {
    final parsed = (jsonDecode(responseBody)).cast<Map<String, dynamic>>();

    return parsed
        .map<ExchangeRateModel>((json) => ExchangeRateModel.fromJson(json));
  }
}

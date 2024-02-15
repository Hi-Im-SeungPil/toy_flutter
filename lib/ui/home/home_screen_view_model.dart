import 'package:flutter/cupertino.dart';
import 'package:toy_flutter/data/network/model/response/exchange_rate_model.dart';
import 'package:toy_flutter/data/sqlite/model/currency_log.dart';
import 'package:toy_flutter/repository/local_repository.dart';
import 'package:toy_flutter/repository/network_repository.dart';
import 'package:toy_flutter/util/log.dart';

class HomeScreenViewModel with ChangeNotifier {
  final networkRepository = NetworkRepository();
  final localRepository = LocalRepository();

  ExchangeRateModel? _exchangeRateModel;
  ExchangeRateModel? get exchangeRateModel => _exchangeRateModel;

  void requestExchangeRate(String targetCurrency) async {
    try {
      final exchangeRate = await networkRepository
          .requestExchangeRate(targetCurrency.toLowerCase());
      _exchangeRateModel = exchangeRate!;
      notifyListeners();
    } on Exception catch (e, s) {
      Log.d("exception => $e");
      Log.d("stackTrace => $s");
    }
  }

  void saveCurrencyLog(String currencyUnit) {
    if (_exchangeRateModel != null) {
      DateTime dateTime = DateTime.now();
      String saveTime =
          '${dateTime.year} ${dateTime.month} ${dateTime.day} ${dateTime
          .hour} ${dateTime.minute}';
      String currencyPrice = (_exchangeRateModel!.price * 1000).toStringAsFixed(2);

      localRepository.insertCurrencyLog(
          CurrencyLog(
          id: null,
          saveTime: saveTime,
          currencyUnit: currencyUnit,
          currencyPrice: currencyPrice
      ));
    }
  }

  void showCurrencyLog() async {
    List<CurrencyLog> list = await localRepository.getCurrencyLogs();
    for (var element in list) {
      Log.d("${element.saveTime} ${element.currencyUnit} ${element.currencyPrice}");
    }
  }
}

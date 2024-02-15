import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:toy_flutter/data/network/model/response/exchange_rate_model.dart';
import 'home_screen_view_model.dart';

class HomeScreenHolder {
  late  HomeScreenViewModel _viewModel;
  final currencyUnitTextController = TextEditingController();

  HomeScreenHolder({required BuildContext context}) {
    _viewModel = Provider.of<HomeScreenViewModel>(context, listen: false);
  }

  void getCurrencyRateButtonListener() {
    _viewModel.requestExchangeRate(currencyUnitTextController.text);
  }

  String getCurrencyText() {
    ExchangeRateModel? exchangeRateModel = _viewModel.exchangeRateModel;
    if (exchangeRateModel != null) {
      String price = (exchangeRateModel.price * 1000).toStringAsFixed(2);
      String currencyText =
          '기준일 : ${exchangeRateModel.date}\n1000원 기준 환율 : $price';
      return currencyText;
    } else {
      return "";
    }
  }

  void saveCurrencyLog() {
    _viewModel.saveCurrencyLog(currencyUnitTextController.text);
  }

  void showCurrencyLog() {
    _viewModel.showCurrencyLog();
  }
}
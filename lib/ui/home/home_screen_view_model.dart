import 'package:flutter/cupertino.dart';
import 'package:toy_flutter/repository/network_repository.dart';

class HomeScreenViewModel with ChangeNotifier {
  final networkRepository = NetworkRepository();

  void requestExchangeRate(String targetCurrency) async {
    final exchangeRate = await networkRepository.requestExchangeRate(targetCurrency);
    exchangeRate.date

  }

}

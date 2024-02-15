class CurrencyLog {
  final int? id;
  final String saveTime;
  final String currencyUnit;
  final String currencyPrice;

  const CurrencyLog(
      {required this.id,
      required this.saveTime,
      required this.currencyUnit,
      required this.currencyPrice});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'saveTime': saveTime,
      'currencyUnit': currencyUnit,
      'currencyPrice': currencyPrice
    };
  }

  @override
  String toString() {
    return 'CurrencyLog{id: $id, saveTime: $saveTime, currencyUnit: $currencyUnit, currencyPrice: $currencyPrice}';
  }
}

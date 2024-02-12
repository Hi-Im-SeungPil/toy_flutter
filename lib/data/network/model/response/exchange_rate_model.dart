class ExchangeRateModel {
  final String date;
  final double price;

  const ExchangeRateModel({required this.date, required this.price});

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    return ExchangeRateModel(
        date: json['date'] as String,
        price: json['price'] as double
    );
  }
}

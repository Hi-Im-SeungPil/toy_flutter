import 'package:sqflite/sqflite.dart';
import 'package:toy_flutter/data/sqlite/model/currency_log.dart';
import 'package:toy_flutter/data/sqlite/toy_database.dart';

class LocalRepository {
  Future<void> insertCurrencyLog(CurrencyLog currencyLog) async {
    ToyDatabase dbInstance = ToyDatabase();
    Database db = await dbInstance.database;

    await db.insert('currency_log', currencyLog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CurrencyLog>> getCurrencyLogs() async {
    ToyDatabase dbInstance = ToyDatabase();
    Database db = await dbInstance.database;

    final List<Map<String, dynamic>> maps = await db.query("currency_log");

    return List.generate(maps.length, (i) {
      return CurrencyLog(id: maps[i]['id'],
          saveTime: maps[i]['saveTime'],
          currencyUnit: maps[i]['currencyUnit'],
          currencyPrice: maps[i]['currencyPrice']);
    });
  }
}

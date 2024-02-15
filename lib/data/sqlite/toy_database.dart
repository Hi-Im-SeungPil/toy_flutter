import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ToyDatabase {
    ToyDatabase._instance() {
        _initDatabase();
    }
    factory ToyDatabase() {
        return instance;
    }
    static final ToyDatabase instance = ToyDatabase._instance();
    Database? _database;

    Future<Database> get database async {
        if(_database != null) return _database!;
        await _initDatabase();
        return _database!;
    }

    Future<void> _initDatabase() async {
        var databasePath = await getDatabasesPath();
        var path = join (databasePath,"toy.db");
        _database = await openDatabase(path, version: 1, onCreate: _dataBaseCreate);
    }

    void _dataBaseCreate(Database db, int version) async {
        await db.execute(
            'CREATE TABLE currency_log(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,saveTime TEXT,currencyUnit TEXT,currencyPrice TEXT)'
        );
    }
}
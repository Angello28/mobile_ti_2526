import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  static final DatabaseHandler _instance = DatabaseHandler._internal();
  static Database? _database;

  DatabaseHandler._internal();

  factory DatabaseHandler() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //====================================================================

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        url TEXT
      )
    ''');
  }

  Future<int> insertData(Map<String, dynamic> data) async {
    Database db = await database;
    return await db.insert("my_table", data);
  }

  Future<List<Map<String, dynamic>>> loadAllData() async {
    Database db = await database;
    return await db.query("my_table");
  }

  Future<int> updateData(Map<String, dynamic> data, int id) async {
    Database db = await database;
    return await db.update("my_table", data, where: "id = ?", whereArgs: [id]);
  }

  Future<int> deleteData(int id) async {
    Database db = await database;
    return await db.delete("my_table", where: "id = ?", whereArgs: [id]);
  }
}

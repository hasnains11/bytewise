import 'dart:async';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    // Open database and create tables
    return await openDatabase(
      'todos.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isCompleted BOOLEAN);",
        );
      },
    );
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db!.insert(table, data);
  }

  Future<List<Map<String, Object?>>> queryAll(String table) async {
    final db = await database;
    return await db!.query(table);
  }

  Future<int> update(String table, Map<String, dynamic> data, String where,
      List<dynamic> whereArgs) async {
    final db = await database;
    return await db!.update(table, data, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(
      String table, String where, List<dynamic> whereArgs) async {
    final db = await database;
    return await db!.delete(table, where: where, whereArgs: whereArgs);
  }
}

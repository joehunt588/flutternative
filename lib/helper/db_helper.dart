import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    //create sql database video 297
    final dbPath = await sql.getDatabasesPath();
    //open database places.db
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT,image TEXT,loc_lat REAL, loc_lng REAL,address TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    // //create sql database video 297
    // final dbPath = await sql.getDatabasesPath();
    // //open database places.db
    // final sqlDb = await sql.openDatabase(path.join(dbPath, 'places.db'),
    //     onCreate: (db, version) {
    //   return db.execute(
    //       'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT,image TEXT)');
    // }, version: 1);
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}

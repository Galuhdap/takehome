import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final String _databaseName = 'favor.db';

  final int _databaseversion = 2;

  final String table1 = 'fav';


  Database? _database;

  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, _databaseName);

    return openDatabase(path, version: _databaseversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE $table1 (id INTEGER PRIMARY KEY, id_fav INTEGER NULL)''');
  }
}
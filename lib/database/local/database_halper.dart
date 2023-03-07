import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/pelajaran_model.dart';

class DatabaseHalper {
  static final _databaseName = 'optima_app.dp';
  static final _databaseVersion = 1;

  static final tblPelajaran = 'tbl_pelajaran';
  static final id = 'id';
  static final title = 'title';
  static final silabus = 'silabus';
  static final jumlah = 'jumlah';
  static final creatAt = 'creatAt';
  static final updateAt = 'UpdateAt';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tblPelajaran (
        $id INTEGER PRIMARY KEY,
        $title TEXT NOT NULL,
        $silabus TEXT NOT NULL,
        $jumlah REAL NOT NULL,
        $creatAt TEXT NOT NULL,
        $updateAt TEXT NOT NULL
      )
    ''');
  }

  Future<List> all() async {
    final data = await _database!.query(tblPelajaran);
    List result = data.map((e) => PelajaranModel.fromMap(e)).toList();
    return result;
  }
}

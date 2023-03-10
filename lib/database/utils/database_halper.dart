import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/kelas_model.dart';
import '../models/silabus_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  Future<Database?> get db async {
    _db ??= await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'optima_app.db');

    final db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  Future<void> _createDb(Database db, int version) async {
    // create TabelKelas table
    await db.execute('''
      CREATE TABLE ${TabelKelas.tableName} (
        kelasId INTEGER PRIMARY KEY AUTOINCREMENT,
        namaKelas TEXT,
        jumlahSilabus INTEGER,
        createAt INTEGER,
        updateAt INTEGER,
        status INTEGER
      )
    ''');

    // create TabelSilabus table
    await db.execute('''
      CREATE TABLE ${TabelSilabus.tableName} (
        silabusId INTEGER PRIMARY KEY AUTOINCREMENT,
        namaSilabus TEXT,
        modul TEXT,
        tugas TEXT,
        status INTEGER,
        kelasId INTEGER,
        FOREIGN KEY(kelasId) REFERENCES ${TabelKelas.tableName}(kelasId)
      )
    ''');
  }
}

import 'package:flutter/material.dart';

import '../utils/database_halper.dart';
import '../models/kelas_model.dart';

class KelasProvider extends ChangeNotifier {
  late DatabaseHelper _databaseHelper;
  List<TabelKelas> _kelasList = [];

  List<TabelKelas> get kelasList => _kelasList;

  KelasProvider() {
    _databaseHelper = DatabaseHelper.instance;
    fetchKelasList();
  }

  Future<void> fetchKelasList() async {
    final db = await _databaseHelper.db;
    final kelasList = await db!.query(TabelKelas.tableName);
    _kelasList = kelasList.map((e) => TabelKelas.fromMap(e)).toList();
    notifyListeners();
  }

  Future<int> insertKelas(TabelKelas kelas) async {
    final db = await _databaseHelper.db;
    final result = await db!.insert(TabelKelas.tableName, kelas.toMap());
    fetchKelasList();
    return result;
  }

  Future<int> updateKelas(TabelKelas kelas) async {
    final db = await _databaseHelper.db;
    final result = await db!.update(
      TabelKelas.tableName,
      kelas.toMap(),
      where: 'kelasId = ?',
      whereArgs: [kelas.kelasId],
    );
    fetchKelasList();
    return result;
  }

  Future<int> deleteKelas(int kelasId) async {
    final db = await _databaseHelper.db;
    final result = await db!.delete(
      TabelKelas.tableName,
      where: 'kelasId = ?',
      whereArgs: [kelasId],
    );
    fetchKelasList();
    return result;
  }
}

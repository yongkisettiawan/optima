import 'package:flutter/material.dart';

import '../models/silabus_model.dart';
import '../utils/database_halper.dart';

class SilabusProvider extends ChangeNotifier {
  late DatabaseHelper _databaseHelper;
  List<TabelSilabus> _silabusList = [];

  List<TabelSilabus> get silabusList => _silabusList;

  SilabusProvider() {
    _databaseHelper = DatabaseHelper.instance;
    fetchSilabusList();
  }

  Future<void> fetchSilabusList() async {
    final db = await _databaseHelper.db;
    final silabusList = await db!.query(TabelSilabus().toString());
    _silabusList = silabusList.map((e) => TabelSilabus.fromMap(e)).toList();
    notifyListeners();
  }

  Future<int> insertSilabus(TabelSilabus silabus) async {
    final db = await _databaseHelper.db;
    final result = await db!.insert(TabelSilabus().toString(), silabus.toMap());
    fetchSilabusList();
    return result;
  }

  Future<int> updateSilabus(TabelSilabus silabus) async {
    final db = await _databaseHelper.db;
    final result = await db!.update(
      TabelSilabus().toString(),
      silabus.toMap(),
      where: 'silabusId = ?',
      whereArgs: [silabus.silabusId],
    );
    fetchSilabusList();
    return result;
  }

  Future<int> deleteSilabus(int silabusId) async {
    final db = await _databaseHelper.db;
    final result = await db!.delete(
      TabelSilabus().toString(),
      where: 'silabusId = ?',
      whereArgs: [silabusId],
    );
    fetchSilabusList();
    return result;
  }
}
